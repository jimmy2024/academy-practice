module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      method = gets.chomp
      break if method == 'q'

      action = nil

      if method == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end

      action.nil? ? routes[method].call : routes[method][action].call
    end
  end
end

class PostsController
  include Resource
  NOT_FOUND_ERROR = "404 Not Found"

  def initialize
    @posts = ["Hello", "Hello(again)"]
  end

  def index
    @posts.each.with_index { |p, i| puts "#{i} #{p}" }
  end

  def show
    puts "choose post id (0..#{@posts.length - 1})"
    id = gets.chomp
    id = Valid.int(id)
    if id
      puts "id:#{id}, post: #{@posts[@id]}"
    else
      puts NOT_FOUND_ERROR
    end
  end

  def create
    puts 'What your post about'
    post = gets.chomp
    @posts.push(post)
    puts "id:#{@posts.length - 1}, post: #{@posts[id]}"
  end

  def update
    puts "Choose post id (0..#{@posts.length - 1})"
    id = gets.chomp
    id = Valid.int(id)
    puts 'What your post about'
    post = gets.chomp
    if id
      @posts[id] = post
      puts "id:#{id}, post: #{@posts[@id]}"
    else
      puts NOT_FOUND_ERROR
    end
  end

  def destroy
    puts "Choose post id (0..#{@posts.length - 1})"
    id = gets.chomp
    id = Valid.int(id)
    if id
      @posts.delete_at(id)
    else
      puts NOT_FOUND_ERROR
    end

  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choice = gets.chomp
      PostsController.connection(@routes['posts']) if choice == '1'
      break if choice == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = { 'GET' => { 'index' => controller.method(:index), 'show' => controller.method(:show)
    }, 'POST' => controller.method(:create), 'PUT' => controller.method(:update), 'DELETE' => controller.method(:destroy)
    }
  end
end

class Valid
  def self.int(raw)
    val = Integer(raw, exception: false)
  end
end

router = Router.new

router.init
