# /\/\/\/\/\/\/\/\/USERNAME\/\/\/\/\/\/\/\/\/\

resource "aws_secretsmanager_secret" "username" {
  name       = var.username_secret_name
  kms_key_id = aws_kms_key.this.id
}

resource "aws_secretsmanager_secret_version" "username" {
  secret_id     = aws_secretsmanager_secret.username.id
  secret_string = var.username

}

# /\/\/\/\/\/\/\/\/PASSWORD\/\/\/\/\/\/\/\/\/\

resource "random_password" "password_rds" {
  length           = 12
  special          = true
  override_special = "_!%^"
}

resource "aws_secretsmanager_secret" "password" {
  name       = var.password_secret_name
  kms_key_id = aws_kms_key.this.id
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id     = aws_secretsmanager_secret.password.id
  secret_string = random_password.password_rds.result
}


# /\/\/\/\/\/\/\/\/Key Managment Service\/\/\/\/\/\/\/\

resource "aws_kms_key" "this" {


  deletion_window_in_days = var.deletion_window_in_days
  description             = var.description
  enable_key_rotation     = var.enable_key_rotation
  key_usage               = var.key_usage
  multi_region            = var.multi_region
  policy                  = <<EOF
  {
    "Id": "key-consolepolicy-3",
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::877879097973:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        }
    ]
}
EOF


}
