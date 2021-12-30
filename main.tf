terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.0.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "null" {
}

resource "random_pet" "name" {
}

resource "random_password" "password" {
  length = 8
}

resource "random_string" "string" {
  length = 16
}

resource "null_resource" "hello" {
  provisioner "local-exec" {
    command = "echo hello ${random_pet.name.id}"
  }
}

output "my_pet_name" {
  value = random_pet.name.id
}

output "my_password" {
  sensitive = true
  value = random_password.password.id
}

output "my_string" {
  value = random_string.string.id
}