class BaseController
  def initialize(repository)
    @repository = repository
  end

  def list
    view.display(repository.all)
  end

  private

  attr_reader :repository, :view
end
