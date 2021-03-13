require 'test_helper'

class Mutations::CreateGroupTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateGroup.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create a new group' do
    group = perform(
      name: 'Necry Talkie',
      description: 'CHAKAPOCO',
    )

    assert group.persisted?
    assert_equal group.description, 'CHAKAPOCO'
    assert_equal group.name, 'Necry Talkie'
  end
end
