require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  def setup
    @record = Record.new(company_id: 1)
  end

  test "should be valid" do
    assert @record.valid?
  end

  test "company_id should be present" do
    @record.company_id = nil
    assert_not @record.valid?
  end
end
