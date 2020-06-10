class Question

    attr_accessor :id, :title, :body, :author_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE 
                id = ?
        SQL
        return nil unless question.length > 0
        Question.new(question.first)
    end

    def self.find_by_author_id(author_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE 
                author_id = ?
        SQL
        return nil unless question.length > 0
        question.map { |q| Question.new(q) }
    end
    
    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def insert
        raise "#{self} already in database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.author_id)
            INSERT INTO
                questions(title, body, author_id)
            VALUES
                (?, ?, ?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} isn't in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.author_id, self.id)
            UPDATE
                questions
            SET
                title = ?, body = ?, author_id = ?
            WHERE
                id = ?
        SQL
    end

    def author
        raise "#{self} isn't in database" unless self.id
        user = QuestionsDatabase.instance.execute(<<-SQL, self.author_id)
            SELECT
                *
            FROM
                users
            WHERE
                users.id = ?
        SQL
        User.new(user.first)
    end

    def replies
        Reply.find_by_question_id(self.id)
    end

    def followers
        QuestionFollow.followers_for_question_id(self.id)
    end
end