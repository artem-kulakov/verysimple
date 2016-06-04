require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @report = Report.new(company_id: 1)
  end

  test "should be valid" do
    assert @report.valid?
  end

  test "company_id should be present" do
    @report.company_id = nil
    assert_not @report.valid?
  end
end
