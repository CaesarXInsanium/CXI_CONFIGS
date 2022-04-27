terraform {
  backend "s3" {
    bucket         = "hl-terraform-tfstate"
    key            = "student-chrome-extension/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "hl-terraform-tflock"
    encrypt        = "true"
  }
}

module "hl" {
  source = "git@github.com:HonorLock/tf-modules.git//hl"
}

provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::${module.hl.envs.legacy_account}:role/HL-DevOps"
    session_name = "terraform"
  }
  region = module.hl.envs.region
}

locals {
  project   = "student-chrome-extension"
  team_name = "outpost"

  tags = {
    Name             = join("-", ["${local.project}", "iam", "legacy"])
    "hl:Environment" = "legacy"
    "hl:ManagedBy"   = "terraform"
    "hl:App"         = "${local.project}"
    "hl:Team"        = "${local.team_name}"
  }
}
