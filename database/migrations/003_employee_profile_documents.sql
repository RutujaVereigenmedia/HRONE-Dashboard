-- HRONE employee profile tabs: family details and joining documents

CREATE TABLE IF NOT EXISTS employee_family_details (
 employee_id UUID PRIMARY KEY REFERENCES employees(id) ON DELETE CASCADE,
 spouse_name TEXT, father_name TEXT, mother_name TEXT, dependent_names TEXT,
 family_contact TEXT, family_address TEXT,
 created_at TIMESTAMPTZ NOT NULL DEFAULT now(), updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS employee_documents (
 id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 employee_id UUID NOT NULL REFERENCES employees(id) ON DELETE CASCADE,
 file_name TEXT NOT NULL, mime_type TEXT NOT NULL DEFAULT 'application/octet-stream',
 content BYTEA NOT NULL, created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS employee_documents_employee_idx ON employee_documents(employee_id, created_at DESC);
