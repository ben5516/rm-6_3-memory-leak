class Screen1 < UIViewController

  def viewDidLoad
    super

    @queue = Dispatch::Queue.new("bg worker")

    @button = UIButton.buttonWithType(UIButtonTypeCustom)
    @button.setTitle("RUN TEST", forState:UIControlStateNormal)

    @button.frame = CGRectMake(100,100,100,100)

    @button.addTarget(self, action: "run_test", forControlEvents: UIControlEventTouchUpInside)

    view.addSubview(@button)
  end

  def run_test
    if @running
      @running = false
      @button.setTitle("RUN TEST", forState:UIControlStateNormal)
    else
      @button.setTitle("STOP RUN", forState:UIControlStateNormal)

      @queue.async do
        @running = true
        loop do
          break if !@running

          100.times { UIView.alloc.init }
          sleep 0.01
        end
      end
    end
  end

end
