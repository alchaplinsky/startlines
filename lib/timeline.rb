class Timeline

  attr_reader :attributes

  delegate :[], to: :attributes

  def initialize(attrs)
    @attributes = attrs
  end

  def self.all
    files = Dir.entries(path).reject{|f| f == '.' or f == '..'}
    files.map{|f| build_object(File.read(path+f))}
  end

  def self.find(id)
    contents = File.read(path+id+'.json')
    build_object(contents)
  end

  private

  def self.path
    './json/timelines/'
  end

  def self.build_object(contents)
    self.new MultiJson.load(contents).with_indifferent_access
  end
end
