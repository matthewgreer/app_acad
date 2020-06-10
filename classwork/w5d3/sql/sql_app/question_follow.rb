class QuestionFollow  
    attr_accessor :id, :user_id, :question_id
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map {|datum| QuestionFollow.new(datum)}
    end

    def self.find_by_id(id)
        follow = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT 
                * 
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        return nil unless follow.length > 0
        QuestionFollow.new(follow.first)
    end

    def self.followers_for_question_id(question_id)
        users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                users
            JOIN
                question_follows ON users.id = question_follows.user_id
            WHERE
                question_follows.question_id = ?
        SQL
        return nil unless users.length > 0
        users.map {|user| User.new(user)}
    end

    def self.followed_questions_for_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                questions
            JOIN
                question_follows ON questions.id = question_follows.question_id
            WHERE
                question_follows.user_id = ?
        SQL
        return nil if questions.empty?
        questions.map{|q| Question.new(q)}
    end

    def self.most_followed_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n: n)
            SELECT 
                title, body
            FROM
                questions           
            WHERE 
                questions.id IN
                (
                    SELECT
                        question_id
                    FROM
                        question_follows
                    GROUP BY
                        question_id
                    ORDER BY
                        COUNT(user_id) DESC
                    LIMIT :n
                )
        SQL
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def insert
        raise "#{self} already in database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.user_id, self.question_id)
            INSERT INTO
                question_follows(user_id, question_id)
            VALUES
                (?,?)           
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} isn't in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.user_id, self.question_id, self.id)
            UPDATE
                question_follows
            SET
                user_id = ?, question_id = ?
            WHERE
                id = ?
        SQL
    end
end