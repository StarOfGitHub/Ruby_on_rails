class ContentContainerComponent < ApplicationComponent
  def initialize(classes: '', data_attributes: {})
    @classes = classes
    @data_attributes = data_attributes
  end

  private

  attr_reader :classes, :data_attributes
end
