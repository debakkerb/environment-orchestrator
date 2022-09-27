/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "admin_project_id" {
  description = "Existing project ID where the admin resources are stored."
  type        = string
}

variable "admin_orchestrator_id" {
  description = "ID of the service account that will orchestrate the resources inside the admin project."
  type        = string
  default     = "admin-orchestrator"
}

variable "firebase_env_orchestrator_id" {
  description = "ID of the service account that will create the Firebase environments."
  type        = string
  default     = "env-orchestrator"
}

variable "terraform_state_bucket_name" {
  description = "Name of the storage bucket where the Terraform resources will be stored."
  type        = string
  default     = "tf-state-storage"
}

