variable "credentials" {
  description = "My Credentials"
  default     = "./my-credentials.json"
}


variable "project" {
  description = "Project"
  default     = "datatalk-terraform-485415"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "terraform_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "Datatalk-terraform-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}