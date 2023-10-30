
variable "username_secret_name" {
  type    = string
  default = "rds_username3"
}

variable "password_secret_name" {
  type    = string
  default = "rds_password3"
}

variable "subnet_name" {
  type    = string
  default = "rds-subnet-group"
}

variable "subnet_ids" {
  type = list(string)
}

variable "username" {
  type    = string
  default = "admin"
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

#################KMS###################

variable "create" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = true
}

variable "create_replica" {
  description = "Determines whether a replica standard CMK will be created (AWS provided material)"
  type        = bool
  default     = false
}

variable "description" {
  description = "The description of the key as viewed in AWS console"
  type        = string
  default     = null
}

variable "deletion_window_in_days" {
  description = "The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between `7` and `30`, inclusive. If you do not specify a value, it defaults to `30`"
  type        = number
  default     = 7
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled. Defaults to `true`"
  type        = bool
  default     = true
}

variable "key_usage" {
  description = "Specifies the intended use of the key. Valid values: `ENCRYPT_DECRYPT` or `SIGN_VERIFY`. Defaults to `ENCRYPT_DECRYPT`"
  type        = string
  default     = null
}

variable "multi_region" {
  description = "Indicates whether the KMS key is a multi-Region (`true`) or regional (`false`) key. Defaults to `false`"
  type        = bool
  default     = true
}
