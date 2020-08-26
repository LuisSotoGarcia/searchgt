-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
id bigserial NOT NULL,
username varchar NOT NULL,
encrypted_password varchar NOT NULL,
email varchar NULL,
reset_password_token varchar NULL,
reset_password_sent_at timestamp NULL,
remember_created_at timestamp NULL,
deleted_at timestamp NULL,
created_at timestamp NOT NULL,
updated_at timestamp NOT NULL,
CONSTRAINT users_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);
CREATE UNIQUE INDEX index_users_on_username ON public.users USING btree (username);

-- public.locations definition

-- Drop table

-- DROP TABLE public.locations;

CREATE TABLE public.locations (
id bigserial NOT NULL,
"name" varchar NULL,
"level" varchar NULL,
location_id int8 NOT NULL,
created_at timestamp NOT NULL,
updated_at timestamp NOT NULL,
CONSTRAINT locations_pkey PRIMARY KEY (id),
CONSTRAINT fk_rails_e595f9af54 FOREIGN KEY (location_id) REFERENCES locations(id)
);
CREATE INDEX index_locations_on_location_id ON public.locations USING btree (location_id);

-- public.user_admins definition

-- Drop table

-- DROP TABLE public.user_admins;

CREATE TABLE public.user_admins (
id bigserial NOT NULL,
first_names varchar NULL,
last_names varchar NULL,
phone_number timestamp NULL,
photo varchar NULL,
user_id int8 NOT NULL,
created_at timestamp NOT NULL,
updated_at timestamp NOT NULL,
CONSTRAINT user_admins_pkey PRIMARY KEY (id),
CONSTRAINT fk_rails_c3900d3fe1 FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE INDEX index_user_admins_on_user_id ON public.user_admins USING btree (user_id);

-- public.user_buyers definition

-- Drop table

-- DROP TABLE public.user_buyers;

CREATE TABLE public.user_buyers (
id bigserial NOT NULL,
first_names varchar NULL,
last_names varchar NULL,
phone_number timestamp NULL,
photo varchar NULL,
user_id int8 NOT NULL,
created_at timestamp NOT NULL,
updated_at timestamp NOT NULL,
CONSTRAINT user_buyers_pkey PRIMARY KEY (id),
CONSTRAINT fk_rails_398edbda4f FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE INDEX index_user_buyers_on_user_id ON public.user_buyers USING btree (user_id);

-- public.user_sellers definition

-- Drop table

-- DROP TABLE public.user_sellers;

CREATE TABLE public.user_sellers (
id bigserial NOT NULL,
first_names varchar NULL,
last_names varchar NULL,
phone_number timestamp NULL,
verification_photo_code varchar NULL,
user_id int8 NOT NULL,
created_at timestamp NOT NULL,
updated_at timestamp NOT NULL,
CONSTRAINT user_sellers_pkey PRIMARY KEY (id),
CONSTRAINT fk_rails_4ece00a5fc FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE INDEX index_user_sellers_on_user_id ON public.user_sellers USING btree (user_id);

-- public.comerces definition

-- Drop table

-- DROP TABLE public.comerces;

CREATE TABLE public.comerces (
id bigserial NOT NULL,
"name" varchar NULL,
photo varchar NULL,
user_seller_id int8 NOT NULL,
location_id int8 NOT NULL,
created_at timestamp NOT NULL,
updated_at timestamp NOT NULL,
CONSTRAINT comerces_pkey PRIMARY KEY (id),
CONSTRAINT fk_rails_4696321cf8 FOREIGN KEY (location_id) REFERENCES locations(id),
CONSTRAINT fk_rails_ca07f22a39 FOREIGN KEY (user_seller_id) REFERENCES user_sellers(id)
);
CREATE INDEX index_comerces_on_location_id ON public.comerces USING btree (location_id);
CREATE INDEX index_comerces_on_user_seller_id ON public.comerces USING btree (user_seller_id);

-- public.products definition

-- Drop table

-- DROP TABLE public.products;

CREATE TABLE public.products (
id bigserial NOT NULL,
"name" varchar NULL,
description varchar NULL,
price numeric NULL,
photo varchar NULL,
comerce_id int8 NOT NULL,
created_at timestamp NOT NULL,
updated_at timestamp NOT NULL,
CONSTRAINT products_pkey PRIMARY KEY (id),
CONSTRAINT fk_rails_9834e2b0a8 FOREIGN KEY (comerce_id) REFERENCES comerces(id)
);
CREATE INDEX index_products_on_comerce_id ON public.products USING btree (comerce_id);