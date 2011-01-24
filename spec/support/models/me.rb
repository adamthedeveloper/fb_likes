require File.expand_path(File.dirname(__FILE__) + '/../../../app/models/me.rb')
class Me
  require File.expand_path(File.dirname(__FILE__) + '/mocks/graph.rb')
  include Mocks
  def graph
    Mocks::Graph.new
  end
end