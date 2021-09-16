require "test_helper"

class PaymentTermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_term = payment_terms(:one)
  end

  test "should get index" do
    get payment_terms_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_term_url
    assert_response :success
  end

  test "should create payment_term" do
    assert_difference('PaymentTerm.count') do
      post payment_terms_url, params: { payment_term: { description: @payment_term.description, name: @payment_term.name } }
    end

    assert_redirected_to payment_term_url(PaymentTerm.last)
  end

  test "should show payment_term" do
    get payment_term_url(@payment_term)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_term_url(@payment_term)
    assert_response :success
  end

  test "should update payment_term" do
    patch payment_term_url(@payment_term), params: { payment_term: { description: @payment_term.description, name: @payment_term.name } }
    assert_redirected_to payment_term_url(@payment_term)
  end

  test "should destroy payment_term" do
    assert_difference('PaymentTerm.count', -1) do
      delete payment_term_url(@payment_term)
    end

    assert_redirected_to payment_terms_url
  end
end
