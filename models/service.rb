class Service
  include DataMapper::Resource

  property :id, Serial
  property :code, String, required: true
  property :description, Text
  property :author, String, required: true
  property :open, Boolean, default: true
  property :created_at, DateTime

  def to_s
    code
  end

  def url
    "/services/#{code}"
  end
end

