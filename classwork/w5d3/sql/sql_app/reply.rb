class Reply

    attr_accessor :id, :subject_question_id, :parent_reply_id, :reply_author_id, :reply_body

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map {|datum| Reply.new(datum)}
    end

    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)
    end

    def self.find_by_author_id(reply_author_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, reply_author_id)
            SELECT
                *
            FROM
                replies
            WHERE
                reply_author_id = ?
        SQL
        return nil unless reply.length > 0
        reply.map {|r| Reply.new(r)}
    end

    def self.find_by_question_id(subject_question_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, subject_question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                subject_question_id = ?
        SQL
        return nil unless reply.length > 0
        reply.map {|r| Reply.new(r)}
    end

    def initialize(options)
        @id = options['id']
        @subject_question_id = options['subject_question_id']
        @parent_reply_id = options['parent_reply_id']
        @reply_author_id = options['reply_author_id']
        @reply_body = options['reply_body']
    end

    def insert
        raise "#{self} already in database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.subject_question_id, self.parent_reply_id, self.reply_author_id, self.reply_body)
            INSERT INTO
                replies(subject_question_id, parent_reply_id, reply_author_id, reply_body)
            VALUES
                (?, ?, ?, ?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} isn't in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.subject_question_id, self.parent_reply_id, self.reply_author_id, self.reply_body, self.id)
            UPDATE
                replies
            SET
                subject_question_id = ?, parent_reply_id = ?, reply_author_id = ?, reply_body = ?
            WHERE
                id = ?
        SQL
    end

    def author
         raise "#{self} isn't in database" unless self.id
         user = QuestionsDatabase.instance.execute(<<-SQL, self.reply_author_id)
            SELECT
                *
            FROM
                users
            WHERE
                users.id = ?
         SQL
         User.new(user.first)
    end

    def question
        raise "#{self} isn't in database" unless self.id
        question = QuestionsDatabase.instance.execute(<<-SQL, self.subject_question_id)
            SELECT
                *
            FROM
                questions
            WHERE 
                questions.id = ?
        SQL
        Question.new(question.first)
    end

    def parent_reply  
         raise "#{self} isn't in database" unless self.id
         reply = QuestionsDatabase.instance.execute(<<-SQL, self.parent_reply_id)
            SELECT 
                *
            FROM
                replies
            WHERE
                replies.id = ?
         SQL
         Reply.new(reply.first)
    end

    def child_replies
        raise "#{self} isn't in database" unless self.id
        reply = QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.parent_reply_id = ?
        SQL
        reply.map {|r| Reply.new(r)}
    end

end