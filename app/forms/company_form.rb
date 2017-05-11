class CompanyForm < Reform::Form
  include Reform::Form::ActiveModel::ModelReflections

  property :name
  property :logo

end
