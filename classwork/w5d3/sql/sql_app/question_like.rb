class QuestionLike 
    attr_accessor :id, :user_id, :question_id
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map {|datum| QuestionLike.new(datum)}
    end

    def self.find_by_id(id)
        like = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT 
                * 
            FROM
                question_likes
            WHERE
                id = ?
        SQL
        return nil unless like.length > 0
        QuestionLike.new(like.first)
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
                question_likes(user_id, question_id)
            VALUES
                (?,?)           
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} isn't in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.user_id, self.question_id, self.id)
            UPDATE
                question_likes
            SET
                user_id = ?, question_id = ?
            WHERE
                id = ?
        SQL
    end  

end