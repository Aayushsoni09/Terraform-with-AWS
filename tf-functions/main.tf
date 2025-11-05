locals {
  value = "Hello World!"
}

variable "string_list" {
  type = list(string)
  default = [ "name1","name2", "name3","name2" ]
}

output "output" {
  #value = lower(local.value)
  #value = startswith(local.value, "H")
  #value = split(" ", local.value)
  #value = max(1,2,2,3,4)
  #value = min(1,2,2,3,4)
  #value = abs(-15.22)


  #list functions
  #value = length(var.string_list)
  #value = join(":",var.string_list)
  #value = contains(var.string_list,"name2")
  value =  toset(var.string_list)
}