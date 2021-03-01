require "application_system_test_case"

class ReceiptsTest < ApplicationSystemTestCase
  setup do
    @receipt = receipts(:one)
  end

  test "visiting the index" do
    visit receipts_url
    assert_selector "h1", text: "Receipts"
  end

  test "creating a Receipt" do
    visit receipts_url
    click_on "New Receipt"

    fill_in "Image", with: @receipt.image
    fill_in "Phone number", with: @receipt.phone_number
    check "Phone number is correct" if @receipt.phone_number_is_correct
    fill_in "Purchase date", with: @receipt.purchase_date
    check "Purchase date is correct" if @receipt.purchase_date_is_correct
    fill_in "Raw content", with: @receipt.raw_content
    click_on "Create Receipt"

    assert_text "Receipt was successfully created"
    click_on "Back"
  end

  test "updating a Receipt" do
    visit receipts_url
    click_on "Edit", match: :first

    fill_in "Image", with: @receipt.image
    fill_in "Phone number", with: @receipt.phone_number
    check "Phone number is correct" if @receipt.phone_number_is_correct
    fill_in "Purchase date", with: @receipt.purchase_date
    check "Purchase date is correct" if @receipt.purchase_date_is_correct
    fill_in "Raw content", with: @receipt.raw_content
    click_on "Update Receipt"

    assert_text "Receipt was successfully updated"
    click_on "Back"
  end

  test "destroying a Receipt" do
    visit receipts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receipt was successfully destroyed"
  end
end
