check "random_pet_created" {

  assert {
    condition     = random_pet.terraform_pet.id != ""
    error_message = "Random pet resource was not created successfully."
  }

}