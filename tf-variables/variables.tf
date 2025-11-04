variable "instance_type" {
  description = "What type of instance you want?"
  type = string
  validation {
    condition = var.instance_type == "t2.micro" || var.instance_type == "t3.micro"
    error_message = "only t2.micro and t3.micro is allowed"
  }
}

# variable "volume_size" {
#   description = "What size you want?"
#   type = number
#   default = 20
# }

# variable "volume_type" {
#   description = "What volume type you want?"
#   type = string
#   default = "gp2"
# }

variable "ec2-config" {
    type = object({
      v_size = number
      v_type = string
    })
    default = {
      v_size = 20
      v_type = "gp2"
    } 
}

variable "additional_tags" {
  type = map(string) #expecting key:value pair
  default ={}
}