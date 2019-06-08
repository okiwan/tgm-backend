#!/usr/bin/env /bin/bash
psql -h localhost -U postgres -d tgm -c "TRUNCATE backend_group RESTART IDENTITY RESTRICT"
psql -h localhost -U postgres -d tgm << EOF
\copy backend_group(file_id, name, fit_flag, country, components, company_name, product_name, start_date, end_date, destination_location, destination_hotel, status, followup_date, profit, deadline_deposit, assigned_to, memo) from '/Users/socana/Projects/tgm-backend/data/Main.csv' DELIMITER '|' CSV HEADER;
EOF
