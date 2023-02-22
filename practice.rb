class Test
    private
  
    def test2
      puts "test2"
    end
    public :test2
  end
  
  class Klass2 < Test
    def ktest
      puts "ktest"
    end
    
    def ktest2
        test2
    end
  end
  
#   Klass2.new.ktest2