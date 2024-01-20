resource "random_string" "my_random_string" {
  length  = 16
  special = false
}

output "generated_string" {
  value = random_string.my_random_string.result
}
