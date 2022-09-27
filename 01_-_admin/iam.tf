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

resource "google_billing_account_iam_member" "orchestrator_billing_permissions" {
  count              = var.set_billing_permissions ? 1 : 0
  billing_account_id = var.billing_account_id
  member             = "serviceAccount:${google_service_account.orchestrator.email}"
  role               = "roles/billing.user"
}