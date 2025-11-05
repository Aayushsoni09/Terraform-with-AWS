# variable "ec2-config" {
#   type = list(object({
#     ami = string
#     instance_type = string
#   }))
# }

# Using map and forEach to achieve the same

variable "ec2-map" {
  type = map(object({
    ami = string
    instance_type = string
  }))
}