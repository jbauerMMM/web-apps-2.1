require "test_helper"

class CompaniesPageTest < ActionDispatch::IntegrationTest
  test "Visiting /companies/:id/edit shows a form filled with that company's current name, city, and state." do
    company = Company.new
    company["name"] = "Apple"
    company["city"] = "Cupertino"
    company["state"] = "CA"
    company.save

    get("/companies/#{company["id"]}/edit")

    assert_response :success
    assert_select "input[name=name][value=Apple]"
    assert_select "input[name=city][value=Cupertino]"
    assert_select "input[name=state][value=CA]"
  end

  test "The edit form sends a patch request to /companies/:id." do
    company = Company.new
    company["name"] = "Apple"
    company.save

    get("/companies/#{company["id"]}/edit")

    assert_select "form[action='/companies/#{company["id"]}'][method=post]" do
      assert_select "input[type=hidden][name=_method][value=patch]"
    end
  end

  test "Submitting the edit form saves the new name, city, and state on that company's row." do
    company = Company.new
    company["name"] = "Apple"
    company["city"] = "Cupertino"
    company["state"] = "CA"
    company.save

    patch("/companies/#{company["id"]}", params: { "name" => "Amazon", "city" => "Seattle", "state" => "WA" })

    updated = Company.find_by({ "id" => company["id"] })
    assert_equal "Amazon", updated["name"]
    assert_equal "Seattle", updated["city"]
    assert_equal "WA", updated["state"]
  end

  test "After an update, the user is redirected to /companies." do
    company = Company.new
    company["name"] = "Apple"
    company.save

    patch("/companies/#{company["id"]}", params: { "name" => "Amazon", "city" => "Seattle", "state" => "WA" })

    assert_redirected_to "/companies"
  end

  test "The edit page has a Delete button that sends a delete request to /companies/:id." do
    company = Company.new
    company["name"] = "Apple"
    company.save

    get("/companies/#{company["id"]}/edit")

    assert_select "form[action='/companies/#{company["id"]}'][method=post]" do
      assert_select "input[type=hidden][name=_method][value=delete]"
      assert_select "button", "Delete"
    end
  end

  test "Submitting a delete removes that company's row." do
    company = Company.new
    company["name"] = "Apple"
    company.save

    delete("/companies/#{company["id"]}")

    assert_nil Company.find_by({ "id" => company["id"] })
  end

  test "After a delete, the user is redirected to /companies." do
    company = Company.new
    company["name"] = "Apple"
    company.save

    delete("/companies/#{company["id"]}")

    assert_redirected_to "/companies"
  end
end
