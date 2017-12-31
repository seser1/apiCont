


class Contest
  def initialize
    @term=3000
    @db_thread=nil
    @calc_thread=nil
  end

  def run
    @db_thread=Thread.start {
      while true
        puts "db_thread"
        sleep(@term/1000)
      end
    }
    @calc_thread=Thread.start {
      while true
        puts "calc_thread"
        sleep(@term/3000)
      end
    }

    @db_thread.join
  end

end
