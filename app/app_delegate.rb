class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = Screen1.new
    rootViewController.title = 'memory-leak'
    rootViewController.view.backgroundColor = UIColor.blackColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
