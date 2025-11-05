#Number list
variable "number_list" {
  type = list(number)
  default = [ 1,2,3,4,5 ]
}



variable "person_list" {
  type = list(object({
    name = string
    age = number
    
  }))
  default = [{
    name = "john"
    age = 18
  },
  {
    name = "jane"
    age = 10
  }]
}

variable "map_list" {
  type = map(number)
  default = {
    "one" = 1
    "two" = 2
    "three" = 3
  }
}

#Calculations
locals {
  mul = 2*2
  add = 2+2
  eq = local.mul != local.add
  #double the list
double = [for num in var.number_list : num*2]

#odd numbers only
odd = [for num in var.number_list : num if num%2 != 0]


#person list
name = [for name in var.person_list : name.name]

#working with map
map_output = [for key,value in var.map_list : key]

double_map = {for key,value in var.map_list: key => value*2}
}



output "answer" {
  #value = local.odd
  #value = local.name
  #value = local.map_output
  value = local.double_map
}

