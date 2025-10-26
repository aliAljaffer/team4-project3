SET session_replication_role = replica ;
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

SET statement_timeout = 0 ;
SET lock_timeout = 0 ;
SET idle_in_transaction_session_timeout = 0 ;
SET client_encoding = 'UTF8' ;
SET standard_conforming_strings = on ;
SET search_path = public ;
SET check_function_bodies = false ;
SET xmloption = content ;
SET client_min_messages = warning ;
SET row_security = off ;
--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

-- INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
-- 	('00000000-0000-0000-0000-000000000000', '8cac40b9-99ec-482f-a63a-51c3e090d1ac', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ali@tuwaiqtracker.com","user_id":"6650abc6-b88e-4074-a091-2c1273349f45","user_phone":""}}', '2024-09-27 14:36:30.619857+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '67fdf8ea-62ba-4344-84aa-9f51a68a4a89', '{"action":"user_signedup","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"google"}}', '2024-09-27 14:59:50.530516+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '1f21f406-8838-4b98-8e1f-e526a46cbd05', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:01:00.927162+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '004871d8-f35c-4749-83b8-74f4daa1a05a', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:02:00.973696+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '9015ceae-0c9c-44b3-8464-97ccf0ebafcb', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:02:51.70463+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '9851b125-d3b3-480b-91e0-e27802179713', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:03:04.363081+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '846b593f-b95d-4be9-b7e8-85cba73767ca', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:04:10.322715+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', 'd5bdb5b5-a2e8-4fe6-b87f-c021304de58f', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:05:10.372213+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '854b18f3-6f9c-4ae3-97c0-4c42f19b610a', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:05:28.563171+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', 'cc0825c9-8ea9-4ada-a00d-67bbb9c4dd62', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:07:01.596582+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '0098ea5b-d1cb-452c-a6d1-bff4c7b8a972', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:07:53.989438+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', 'b9c57207-fea2-4d31-a127-70806e9a6d92', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:08:44.76116+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '7d1530d9-7af5-4853-af1c-60a50fa6f355', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:09:38.61889+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', 'dc448916-0d90-40da-a129-e368adcd010f', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:15:59.721777+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '13978a36-78df-4d08-8d98-659a3aa662fe', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:16:11.49724+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', 'e7d73846-2076-4b04-bc70-9e0a422ac238', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:34:38.160496+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', 'ae03b34b-0a8f-4619-afc2-36df410284bd', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:35:20.583847+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '9de8e174-34ff-46dc-8ae6-999f4cf7b60c', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:36:08.048505+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '63b1060b-bb32-4e8f-9ee9-966421c7674a', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:36:25.890572+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', 'dab35e98-fc3b-4269-89a3-27c0fe686063', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:37:06.683783+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', '58e9b2aa-409b-4c4c-997f-4cb964005f07', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:38:34.481124+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', 'f469f102-0e28-4d3c-9fbb-6c71f667ae80', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:39:09.803557+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', 'cd25c7a7-6732-49fb-88e3-0f6833f7d49c', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:39:25.517517+00', ''),
-- 	('00000000-0000-0000-0000-000000000000', 'b77b4eeb-0060-4e28-8972-43ed5b177acc', '{"action":"login","actor_id":"174c2e8c-43df-4749-9225-47e1b18fb88f","actor_name":"Ali Aljaffer","actor_username":"xsenioritis@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"google"}}', '2024-09-27 15:41:55.122043+00', '') ON CONFLICT DO NOTHING;
-- --
-- -- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --

-- INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
-- 	('00000000-0000-0000-0000-000000000000', '6650abc6-b88e-4074-a091-2c1273349f45', 'authenticated', 'authenticated', 'ali@tuwaiqtracker.com', '$2a$10$WS83NZ3H4LJTIxLyLGoplezXvmHISP.cU8SJO.qzgVfuPrOkYr666', '2024-09-27 14:36:30.627741+00', NULL, '', NULL, '', NULL, '', '', NULL, NULL, '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2024-09-27 14:36:30.596721+00', '2024-09-27 14:36:30.631215+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
-- 	('00000000-0000-0000-0000-000000000000', '174c2e8c-43df-4749-9225-47e1b18fb88f', 'authenticated', 'authenticated', 'xsenioritis@gmail.com', NULL, '2024-09-27 14:59:50.531213+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-09-27 15:41:55.123388+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "114422051883437799472", "name": "Ali Aljaffer", "email": "xsenioritis@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJijbLuvkxM4JODULUV0kO9gb-6d1tDJxGYc9vqm8sCnbTK4pqD0Q=s96-c", "full_name": "Ali Aljaffer", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJijbLuvkxM4JODULUV0kO9gb-6d1tDJxGYc9vqm8sCnbTK4pqD0Q=s96-c", "provider_id": "114422051883437799472", "email_verified": true, "phone_verified": false}', NULL, '2024-09-27 14:59:50.515106+00', '2024-09-27 15:41:55.126965+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false) ON CONFLICT DO NOTHING;
-- --
-- -- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --

-- INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
-- 	('6650abc6-b88e-4074-a091-2c1273349f45', '6650abc6-b88e-4074-a091-2c1273349f45', '{"sub": "6650abc6-b88e-4074-a091-2c1273349f45", "email": "ali@tuwaiqtracker.com", "email_verified": false, "phone_verified": false}', 'email', '2024-09-27 14:36:30.611663+00', '2024-09-27 14:36:30.612267+00', '2024-09-27 14:36:30.612267+00', '0b46ee67-75cb-445d-be5c-64b4ec273a37'),
-- 	('114422051883437799472', '174c2e8c-43df-4749-9225-47e1b18fb88f', '{"iss": "https://accounts.google.com", "sub": "114422051883437799472", "name": "Ali Aljaffer", "email": "xsenioritis@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJijbLuvkxM4JODULUV0kO9gb-6d1tDJxGYc9vqm8sCnbTK4pqD0Q=s96-c", "full_name": "Ali Aljaffer", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJijbLuvkxM4JODULUV0kO9gb-6d1tDJxGYc9vqm8sCnbTK4pqD0Q=s96-c", "provider_id": "114422051883437799472", "email_verified": true, "phone_verified": false}', 'google', '2024-09-27 14:59:50.524892+00', '2024-09-27 14:59:50.524943+00', '2024-09-27 15:41:55.119091+00', '0cd5f895-5730-41f5-92d1-4aa5676f9942') ON CONFLICT DO NOTHING;
-- --
-- -- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --

-- INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag", "oauth_client_id") VALUES
-- 	('b0e0ac69-0fc7-4d79-953d-cefa80c2cade', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 14:59:50.534685+00', '2024-09-27 14:59:50.534685+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('cb575b0c-25da-4e22-a827-dcc8d5dc2135', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:01:00.927974+00', '2024-09-27 15:01:00.927974+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('dc0d105f-154c-4e99-aa68-c9b43763c452', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:02:00.974535+00', '2024-09-27 15:02:00.974535+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('0bad46fc-cd85-43e0-90d8-ee979b6c1d08', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:02:51.705197+00', '2024-09-27 15:02:51.705197+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('d92773cd-476b-4e28-91cf-3f618dcf04b2', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:03:04.363661+00', '2024-09-27 15:03:04.363661+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('759b70be-9d78-46aa-a476-aa36108317d7', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:04:10.323588+00', '2024-09-27 15:04:10.323588+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('2ab095eb-4020-41d0-a34c-2474abe9190e', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:05:10.373083+00', '2024-09-27 15:05:10.373083+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('be97b786-e7ea-4b70-9149-92e6c64f5a8b', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:05:28.563765+00', '2024-09-27 15:05:28.563765+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('ddaf9018-d381-4e44-80b5-178f1270cb52', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:07:01.597439+00', '2024-09-27 15:07:01.597439+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('43856228-35d4-46ff-b2d9-0e8953178643', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:07:53.990016+00', '2024-09-27 15:07:53.990016+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('c6dd2891-8426-4452-af6c-4cb3b3d18e78', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:08:44.762912+00', '2024-09-27 15:08:44.762912+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('d0ddb04b-91a3-40f2-860d-900ad2fdcc92', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:09:38.619495+00', '2024-09-27 15:09:38.619495+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('e0a24732-373e-42a5-af40-55ab5d72c289', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:15:59.723258+00', '2024-09-27 15:15:59.723258+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('368fa2a7-a504-48b7-9932-853fbe9ad584', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:16:11.49791+00', '2024-09-27 15:16:11.49791+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('94242195-d78a-4827-938b-ff0e64172536', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:34:38.161407+00', '2024-09-27 15:34:38.161407+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('6f98464d-e805-42a9-a065-409b19a040ee', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:35:20.584483+00', '2024-09-27 15:35:20.584483+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('91e3bead-ba34-485d-b5e6-88fa4932f1a9', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:36:08.049732+00', '2024-09-27 15:36:08.049732+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('5a23275b-c355-46f5-970d-776b62af3609', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:36:25.891156+00', '2024-09-27 15:36:25.891156+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('7f99ebd9-40da-41e0-822e-a20616f61463', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:37:06.684386+00', '2024-09-27 15:37:06.684386+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('206a20f9-8a24-4cd4-8dd7-1e01d9c05425', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:38:34.48201+00', '2024-09-27 15:38:34.48201+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('b0d5b80b-2515-4c6e-b3eb-99f615e75f2a', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:39:09.804162+00', '2024-09-27 15:39:09.804162+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('f6da66ba-4569-43f3-be4c-ed5950227349', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:39:25.518098+00', '2024-09-27 15:39:25.518098+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL),
-- 	('f17377b6-b274-4891-b717-146650a857e2', '174c2e8c-43df-4749-9225-47e1b18fb88f', '2024-09-27 15:41:55.123468+00', '2024-09-27 15:41:55.123468+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '145.82.10.107', NULL, NULL) ON CONFLICT DO NOTHING;
-- --
-- -- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --

-- INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
-- 	('b0e0ac69-0fc7-4d79-953d-cefa80c2cade', '2024-09-27 14:59:50.556808+00', '2024-09-27 14:59:50.556808+00', 'oauth', '84befff1-33e6-41e9-af20-317f1f73b413'),
-- 	('cb575b0c-25da-4e22-a827-dcc8d5dc2135', '2024-09-27 15:01:00.930797+00', '2024-09-27 15:01:00.930797+00', 'oauth', '13986e36-ed18-489e-b3bf-c77af0655ee9'),
-- 	('dc0d105f-154c-4e99-aa68-c9b43763c452', '2024-09-27 15:02:00.977507+00', '2024-09-27 15:02:00.977507+00', 'oauth', '5751a748-8689-4b98-8aed-50774bd441c3'),
-- 	('0bad46fc-cd85-43e0-90d8-ee979b6c1d08', '2024-09-27 15:02:51.706857+00', '2024-09-27 15:02:51.706857+00', 'oauth', 'f973a684-9926-4b27-9f78-180d9004dd35'),
-- 	('d92773cd-476b-4e28-91cf-3f618dcf04b2', '2024-09-27 15:03:04.366075+00', '2024-09-27 15:03:04.366075+00', 'oauth', 'be2906ef-df20-48ee-b758-966cb61f0fbb'),
-- 	('759b70be-9d78-46aa-a476-aa36108317d7', '2024-09-27 15:04:10.327216+00', '2024-09-27 15:04:10.327216+00', 'oauth', 'f4b234af-5f9f-4e34-8cc3-66f33a748546'),
-- 	('2ab095eb-4020-41d0-a34c-2474abe9190e', '2024-09-27 15:05:10.37582+00', '2024-09-27 15:05:10.37582+00', 'oauth', 'f80085d2-cd60-4ed9-bf7d-3e5f8715ec9a'),
-- 	('be97b786-e7ea-4b70-9149-92e6c64f5a8b', '2024-09-27 15:05:28.56707+00', '2024-09-27 15:05:28.56707+00', 'oauth', '7c9cf17e-58b4-48cd-b43f-ef427f67a701'),
-- 	('ddaf9018-d381-4e44-80b5-178f1270cb52', '2024-09-27 15:07:01.600291+00', '2024-09-27 15:07:01.600291+00', 'oauth', 'a05f9a6d-2566-41db-af57-bbbb044b587f'),
-- 	('43856228-35d4-46ff-b2d9-0e8953178643', '2024-09-27 15:07:53.991777+00', '2024-09-27 15:07:53.991777+00', 'oauth', 'a1ed6c47-82d3-4fa6-a592-a6ebba764a25'),
-- 	('c6dd2891-8426-4452-af6c-4cb3b3d18e78', '2024-09-27 15:08:44.766891+00', '2024-09-27 15:08:44.766891+00', 'oauth', 'd18672ba-3a94-4896-84e4-28776e936d35'),
-- 	('d0ddb04b-91a3-40f2-860d-900ad2fdcc92', '2024-09-27 15:09:38.62138+00', '2024-09-27 15:09:38.62138+00', 'oauth', '158b6b90-ec90-4c3a-83df-b4b15ab52664'),
-- 	('e0a24732-373e-42a5-af40-55ab5d72c289', '2024-09-27 15:15:59.726742+00', '2024-09-27 15:15:59.726742+00', 'oauth', '143f28db-a5a9-4045-9b32-0201c3a034cb'),
-- 	('368fa2a7-a504-48b7-9932-853fbe9ad584', '2024-09-27 15:16:11.499916+00', '2024-09-27 15:16:11.499916+00', 'oauth', 'e67577a9-2f6e-4c4c-9ce1-1cb3fcd68c42'),
-- 	('94242195-d78a-4827-938b-ff0e64172536', '2024-09-27 15:34:38.16509+00', '2024-09-27 15:34:38.16509+00', 'oauth', 'cd6ff55d-aab1-4e9c-a2b7-7b9f431dad50'),
-- 	('6f98464d-e805-42a9-a065-409b19a040ee', '2024-09-27 15:35:20.586456+00', '2024-09-27 15:35:20.586456+00', 'oauth', '2d4a4711-fc79-4682-be53-6dc1c1e971f5'),
-- 	('91e3bead-ba34-485d-b5e6-88fa4932f1a9', '2024-09-27 15:36:08.05347+00', '2024-09-27 15:36:08.05347+00', 'oauth', '37783173-4dc8-4f0a-ae4a-02a0bcbad240'),
-- 	('5a23275b-c355-46f5-970d-776b62af3609', '2024-09-27 15:36:25.893788+00', '2024-09-27 15:36:25.893788+00', 'oauth', '51d8f898-2c06-465f-b851-61c22dfe13fb'),
-- 	('7f99ebd9-40da-41e0-822e-a20616f61463', '2024-09-27 15:37:06.686978+00', '2024-09-27 15:37:06.686978+00', 'oauth', '2d6d29e3-1c8a-4353-9542-769bbc41d8b8'),
-- 	('206a20f9-8a24-4cd4-8dd7-1e01d9c05425', '2024-09-27 15:38:34.487018+00', '2024-09-27 15:38:34.487018+00', 'oauth', '08d134b0-6dbf-40ae-92a8-5d864db7b140'),
-- 	('b0d5b80b-2515-4c6e-b3eb-99f615e75f2a', '2024-09-27 15:39:09.806021+00', '2024-09-27 15:39:09.806021+00', 'oauth', 'edef9a53-feab-4e89-a72e-3db23995cc08'),
-- 	('f6da66ba-4569-43f3-be4c-ed5950227349', '2024-09-27 15:39:25.519835+00', '2024-09-27 15:39:25.519835+00', 'oauth', 'acfc0a39-00e7-4a87-a2fe-34631f43580d'),
-- 	('f17377b6-b274-4891-b717-146650a857e2', '2024-09-27 15:41:55.127384+00', '2024-09-27 15:41:55.127384+00', 'oauth', 'f485ec22-da64-4610-89f9-be99fd2b8003') ON CONFLICT DO NOTHING;
-- --
-- -- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --

-- INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
-- 	('00000000-0000-0000-0000-000000000000', 1, 'Yi8B5J6pJr5EVU_rnKOQPg', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 14:59:50.544633+00', '2024-09-27 14:59:50.544633+00', NULL, 'b0e0ac69-0fc7-4d79-953d-cefa80c2cade'),
-- 	('00000000-0000-0000-0000-000000000000', 2, 'vffOJgUaP9Lm46LiKXj1xQ', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:01:00.928959+00', '2024-09-27 15:01:00.928959+00', NULL, 'cb575b0c-25da-4e22-a827-dcc8d5dc2135'),
-- 	('00000000-0000-0000-0000-000000000000', 3, 'VDl0YxvyCkZorWYdQNnWxg', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:02:00.975594+00', '2024-09-27 15:02:00.975594+00', NULL, 'dc0d105f-154c-4e99-aa68-c9b43763c452'),
-- 	('00000000-0000-0000-0000-000000000000', 4, 'dCNplVZexUs7R7yDBvM61A', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:02:51.705807+00', '2024-09-27 15:02:51.705807+00', NULL, '0bad46fc-cd85-43e0-90d8-ee979b6c1d08'),
-- 	('00000000-0000-0000-0000-000000000000', 5, '9lRZ4_hVCEVeu-RMF8XbBg', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:03:04.364326+00', '2024-09-27 15:03:04.364326+00', NULL, 'd92773cd-476b-4e28-91cf-3f618dcf04b2'),
-- 	('00000000-0000-0000-0000-000000000000', 6, 'MRkF4gUXa9asLfK7_ZsUUA', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:04:10.324713+00', '2024-09-27 15:04:10.324713+00', NULL, '759b70be-9d78-46aa-a476-aa36108317d7'),
-- 	('00000000-0000-0000-0000-000000000000', 7, 'ijFvlKngvhrY72uju-070Q', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:05:10.374046+00', '2024-09-27 15:05:10.374046+00', NULL, '2ab095eb-4020-41d0-a34c-2474abe9190e'),
-- 	('00000000-0000-0000-0000-000000000000', 8, 'z-TyrdYVjLtz14d0w-2L2A', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:05:28.565124+00', '2024-09-27 15:05:28.565124+00', NULL, 'be97b786-e7ea-4b70-9149-92e6c64f5a8b'),
-- 	('00000000-0000-0000-0000-000000000000', 9, 'Bl427bzhpePveLozXjKkPQ', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:07:01.598443+00', '2024-09-27 15:07:01.598443+00', NULL, 'ddaf9018-d381-4e44-80b5-178f1270cb52'),
-- 	('00000000-0000-0000-0000-000000000000', 10, '2MUdz6VFhnd9h3k_QZ9VAg', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:07:53.990636+00', '2024-09-27 15:07:53.990636+00', NULL, '43856228-35d4-46ff-b2d9-0e8953178643'),
-- 	('00000000-0000-0000-0000-000000000000', 11, 'gPGwgx-76asyfwbjlZpB8w', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:08:44.764132+00', '2024-09-27 15:08:44.764132+00', NULL, 'c6dd2891-8426-4452-af6c-4cb3b3d18e78'),
-- 	('00000000-0000-0000-0000-000000000000', 12, '-84a0C3puKK4m28mhEAxNw', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:09:38.62017+00', '2024-09-27 15:09:38.62017+00', NULL, 'd0ddb04b-91a3-40f2-860d-900ad2fdcc92'),
-- 	('00000000-0000-0000-0000-000000000000', 13, 'T-mEDpwR9xBMqWYTa47HFA', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:15:59.724949+00', '2024-09-27 15:15:59.724949+00', NULL, 'e0a24732-373e-42a5-af40-55ab5d72c289'),
-- 	('00000000-0000-0000-0000-000000000000', 14, 'wCwV9QpKMvNgBL0FEysq8Q', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:16:11.49862+00', '2024-09-27 15:16:11.49862+00', NULL, '368fa2a7-a504-48b7-9932-853fbe9ad584'),
-- 	('00000000-0000-0000-0000-000000000000', 15, 'PAWeKmQgk7SkepRySef0GA', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:34:38.163138+00', '2024-09-27 15:34:38.163138+00', NULL, '94242195-d78a-4827-938b-ff0e64172536'),
-- 	('00000000-0000-0000-0000-000000000000', 16, '8Xm1I6rZJ1VCudIMNk1bFg', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:35:20.585253+00', '2024-09-27 15:35:20.585253+00', NULL, '6f98464d-e805-42a9-a065-409b19a040ee'),
-- 	('00000000-0000-0000-0000-000000000000', 17, 'Uy0QyjaT8tlTxVwJadgZmw', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:36:08.051497+00', '2024-09-27 15:36:08.051497+00', NULL, '91e3bead-ba34-485d-b5e6-88fa4932f1a9'),
-- 	('00000000-0000-0000-0000-000000000000', 18, 'H781RYBmzW1sKvSrAbMkUA', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:36:25.891827+00', '2024-09-27 15:36:25.891827+00', NULL, '5a23275b-c355-46f5-970d-776b62af3609'),
-- 	('00000000-0000-0000-0000-000000000000', 19, 'f9Ar5TbkSufLTmIK24NFxA', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:37:06.685085+00', '2024-09-27 15:37:06.685085+00', NULL, '7f99ebd9-40da-41e0-822e-a20616f61463'),
-- 	('00000000-0000-0000-0000-000000000000', 20, 'ZTyCO5pks2riXOtlTHsFJg', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:38:34.485053+00', '2024-09-27 15:38:34.485053+00', NULL, '206a20f9-8a24-4cd4-8dd7-1e01d9c05425'),
-- 	('00000000-0000-0000-0000-000000000000', 21, 'ynbhyPLLFuuBQSRJWQCR-g', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:39:09.804835+00', '2024-09-27 15:39:09.804835+00', NULL, 'b0d5b80b-2515-4c6e-b3eb-99f615e75f2a'),
-- 	('00000000-0000-0000-0000-000000000000', 22, '4lYZJIKu6XgPfAQmstO51g', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:39:25.518722+00', '2024-09-27 15:39:25.518722+00', NULL, 'f6da66ba-4569-43f3-be4c-ed5950227349'),
-- 	('00000000-0000-0000-0000-000000000000', 23, 'qzyXVxrjl6QXhNBn_Msulg', '174c2e8c-43df-4749-9225-47e1b18fb88f', false, '2024-09-27 15:41:55.124495+00', '2024-09-27 15:41:55.124495+00', NULL, 'f17377b6-b274-4891-b717-146650a857e2') ON CONFLICT DO NOTHING;
-- --
-- -- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
-- --



-- --
-- -- Data for Name: Test; Type: TABLE DATA; Schema: public; Owner: postgres
-- --



--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."pets" ("caseId", "name", "petType", "contact", "isLost", "caseStatus", "position__latitude", "position__longitude", "imageUrl", "description", "message", "reporterName", "reward", "breed", "tags", "language", "reportDate", "microchip__hasMicrochip", "microchip__microchipNumber") VALUES
	(1000, 'Jasper', 'dog', '+18155102959', true, 'open', 26.343636053248478, 50.16305623499526, 'https://random.dog/b3d18975-1146-457f-a95c-5eae994c2e9e.jpg', 'Yellow Labrador lost near Khobar''s Corniche.', 'Jasper is very playful and may approach people.', 'Ahmed AlSaeed', '0', 'Labrador', 'playful, yellow, large', 'ar', '2024-09-20 15:45:00+00', true, '9876543210'),
	(1001, 'Luna', 'cat', 'Zainab_AlHarthi6@yahoo.com', false, 'open', 21.508428505481085, 39.8856548804518, 'https://cdn2.thecatapi.com/images/MTkzMzUzNg.jpg', 'White cat found near Makkah.', 'Luna was found near the Grand Mosque. She seems well-fed.', 'Zainab AlHarthi', '0', 'Persian', 'friendly, white, small', 'en', '2024-09-22 08:30:00+00', false, 'null'),
	(1002, 'Bear', 'dog', 'Ali_AlZahrani@yahoo.com', true, 'open', 24.80734258310528, 46.73611584183454, 'https://random.dog/99922971-447f-4785-b5fe-db96f9938994.jpg', 'Golden retriever lost near Riyadh''s Al-Malaz.', 'Bear is friendly and may approach children.', 'Ali AlZahrani', '275', 'Golden Retriever', 'friendly, golden, large', 'ar', '2024-09-21 13:00:00+00', true, '7654321098'),
	(1003, 'Charlie', 'dog', 'Amna_AlHarbi49@yahoo.com', false, 'open', 26.459372577907303, 50.04497708661578, 'https://random.dog/ef2032c1-6d37-41de-b43f-d0cb2dc4ebd1.jpeg', 'Brown Doberman found near Khobar.', 'Charlie is very friendly and playful. He might belong to someone nearby.', 'Amna AlHarbi', '0', 'Doberman', 'friendly, brown, large', 'en', '2024-09-23 09:15:00+00', true, '1231231231'),
	(1004, 'Fido', 'dog', 'Jessica_Lee@gmail.com', true, 'open', 40.62370104422503, -73.96754307676136, 'https://random.dog/8536-28743-5665.jpg', 'Mixed breed dog lost in New York City.', 'Fido is friendly but might be scared.', 'Jessica Lee', '0', 'Mixed Breed', 'friendly, medium, mixed', 'en', '2024-09-20 16:30:00+00', false, 'null'),
	(1005, 'Rex', 'dog', '+15448910621', false, 'open', 35.75629123783568, 139.7246300909004, 'https://random.dog/027eef85-ccc1-4a66-8967-5d74f34c8bb4.jpg', 'Siberian Husky found in Tokyo, Japan.', 'Rex was found wandering near a busy street. He is very friendly.', 'Keiko Yoshida', '0', 'Siberian Husky', 'friendly, large, medium', 'en', '2024-09-22 14:30:00+00', true, '4567891234'),
	(1006, 'Sasha', 'cat', 'Layla_AlRashid8@hotmail.com', true, 'open', 24.89996902592672, 46.63522512069537, 'https://cdn2.thecatapi.com/images/cb2.jpg', 'Black and white cat lost near Riyadh''s Al-Suwayd.', 'Sasha is very shy and may be hiding.', 'Layla AlRashid', '200', 'Domestic Shorthair', 'shy, black and white, small', 'ar', '2024-09-20 18:00:00+00', true, '7891234567'),
	(1007, 'Oscar', 'dog', 'Tomoko_Sato@yahoo.com', true, 'open', 35.75639337048005, 139.67295884169013, 'https://random.dog/f856b11f-6d47-4089-9edf-aad8107161d0.jpg', 'Poodle lost in Tokyo, Japan.', 'Oscar is very friendly and playful.', 'Tomoko Sato', '0', 'Poodle', 'friendly, medium, playful', 'en', '2024-09-22 10:00:00+00', true, '6543210987'),
	(1008, 'Toby', 'dog', '+966569876543', true, 'open', 24.848514016289204, 46.6610557215379, 'https://random.dog/f856b11f-6d47-4089-9edf-aad8107161d0.jpg', 'Golden Retriever lost near Riyadh''s Al-Malaz.', 'Toby is very playful and loves to fetch.', 'Aisha AlHassan', '0', 'Golden Retriever', 'playful, golden, large', 'ar', '2024-09-20 12:00:00+00', true, '3213213213'),
	(1010, 'Bella', 'cat', 'Yuki_Takahashi16@yahoo.com', true, 'open', 35.71647140798452, 139.56508826808914, 'https://cdn2.thecatapi.com/images/bpk.jpg', 'Tabby cat lost in Tokyo.', 'Bella is timid and may be hiding.', 'Yuki Takahashi', '0', 'Tabby', 'timid, tabby, small', 'en', '2024-09-22 17:45:00+00', false, 'null'),
	(1011, 'Milo', 'dog', '+966566789012', true, 'open', 30.97857621516693, 30.83162744614719, 'https://random.dog/d9eb4337-5824-4884-a351-23261f228c1a.JPG', 'Maltese lost near Cairo.', 'Milo is very friendly and loves attention.', 'Fatima Ahmed', '0', 'Maltese', 'friendly, small, white', 'ar', '2024-09-23 11:00:00+00', true, '7894561230'),
	(1012, 'Shadow', 'cat', 'Emily.Johnson28@yahoo.com', false, 'open', 51.48585328674381, -0.09001465604891223, 'https://cdn2.thecatapi.com/images/c3v.jpg', 'Black cat found in London.', 'Shadow seems well cared for.', 'Emily Johnson', '358', 'Domestic Shorthair', 'friendly, black, small', 'en', '2024-09-22 09:00:00+00', false, 'null'),
	(1013, 'Max', 'dog', '+19294921092', true, 'open', 37.94739891575585, -122.38588438243778, 'https://random.dog/bc1225bc-3d15-41c8-a0e3-36f47de9cc5f.jpg', 'Beagle lost in San Francisco.', 'Max is very friendly and loves treats.', 'Samuel Adams', '0', 'Beagle', 'friendly, small, beagle', 'en', '2024-09-23 16:00:00+00', true, '3216549870'),
	(1014, 'Daisy', 'cat', '+966534567890', true, 'open', 26.35326080098596, 50.07043745239953, 'https://cdn2.thecatapi.com/images/MjAwOTE2NA.png', 'Siamese cat lost in Khobar.', 'Daisy is very shy and may be hiding under furniture.', 'Sara AlMansoori', '100', 'Siamese', 'shy, siamese, small', 'ar', '2024-09-21 14:15:00+00', true, '6543217890'),
	(1015, 'Rocky', 'dog', 'James_Smith@yahoo.com', true, 'open', 40.680591546411755, -74.14467128856587, 'https://random.dog/c814f405-4bf3-40ac-a7a3-7adbf5ef8703.jpg', 'Pit Bull lost in New York City.', 'Rocky is friendly but may be scared.', 'James Smith', '0', 'Pit Bull', 'friendly, large, scared', 'en', '2024-09-20 17:00:00+00', false, 'null'),
	(1016, 'Chloe', 'cat', 'Lisa_Wang@gmail.com', false, 'open', 33.983411683930065, -118.30229500704661, 'https://cdn2.thecatapi.com/images/bm5.jpg', 'Persian cat found in Los Angeles.', 'Chloe is very friendly and loves cuddles.', 'Lisa Wang', '35', 'Persian', 'friendly, large, persian', 'en', '2024-09-22 10:30:00+00', true, '9638527410'),
	(1017, 'Ginger', 'cat', 'Mark.Taylor@hotmail.com', true, 'open', 37.7208903309826, -122.59797236878443, 'https://cdn2.thecatapi.com/images/YmPlzWUvb.jpg', 'Orange tabby lost in San Francisco.', 'Ginger is very friendly and loves to play.', 'Mark Taylor', '363', 'Tabby', 'friendly, orange, small', 'en', '2024-09-21 12:30:00+00', true, '1472583690'),
	(1018, 'Coco', 'dog', '+15302224424', false, 'open', 51.509996187425095, -0.23001438263401372, 'https://random.dog/63d52a36-2d98-494c-bbe9-d96ddc814040.jpg', 'Chihuahua found in London.', 'Coco is very small and friendly.', 'Sarah Brown', '0', 'Chihuahua', 'friendly, small, chihuahua', 'en', '2024-09-20 08:00:00+00', false, 'null'),
	(1019, 'Whiskers', 'cat', '+18757548308', true, 'open', 29.02438900523616, 35.82800898325406, 'https://cdn2.thecatapi.com/images/acs.jpg', 'Gray cat lost near Cairo.', 'Whiskers is very shy and may be hiding.', 'Mona Hassan', '0', 'Domestic Shorthair', 'shy, gray, small', 'ar', '2024-09-23 12:00:00+00', true, '2589631470'),
	(1020, 'Fuzzy', 'cat', 'Haruki_Nakagawa99@hotmail.com', false, 'open', 35.84277874856819, 139.61867285912274, 'https://cdn2.thecatapi.com/images/2re.jpg', 'Fluffy cat found in Tokyo.', 'Fuzzy seems well cared for.', 'Haruki Nakagawa', '0', 'Siberian', 'friendly, fluffy, medium', 'en', '2024-09-21 13:00:00+00', false, 'null'),
	(1021, 'unknown', 'dog', 'Oliver_Garcia@gmail.com', true, 'open', 34.107745966491656, -118.27105814745408, 'https://random.dog/c494d883-9a34-4d8d-b0b3-449069c30f23.mp4', 'Shih Tzu lost in Los Angeles.', 'dog is very friendly and loves to play.', 'Oliver Garcia', '0', 'Shih Tzu', 'friendly, small, shih tzu', 'en', '2024-09-20 19:30:00+00', true, '3216549871'),
	(1022, 'Princess', 'cat', '+13896442537', false, 'open', 40.85607883110232, -74.01366593223129, 'https://cdn2.thecatapi.com/images/f8FUsjdUw.jpg', 'Calico cat found in New York City.', 'Princess is very friendly and loves to play.', 'Anna Johnson', '0', 'Calico', 'friendly, small, calico', 'en', '2024-09-22 15:00:00+00', false, 'null'),
	(1023, 'Bella', 'dog', '+15093747072', true, 'open', 34.169627802371906, -118.30826417399363, 'https://random.dog/76258707-3490-4a44-b186-b7fa271e71f8.jpg', 'Golden Retriever lost in Los Angeles.', 'Bella is very friendly and loves to fetch.', 'Sophia Smith', '0', 'Golden Retriever', 'friendly, golden, large', 'en', '2024-09-23 14:00:00+00', true, '4567893210'),
	(1024, 'Tiger', 'cat', '+12629530352', true, 'open', 37.832641290327096, -122.512960183219, 'https://cdn2.thecatapi.com/images/aud.jpg', 'Tabby cat lost in San Francisco.', 'Tiger is very friendly and loves to explore.', 'Lucas Brown', '0', 'Tabby', 'friendly, tabby, medium', 'en', '2024-09-22 11:30:00+00', false, 'null'),
	(1025, 'Mittens', 'cat', 'Hiroshi_Yamamoto51@gmail.com', false, 'open', 35.64090748600148, 139.585573672753, 'https://cdn2.thecatapi.com/images/OUZlUVIco.jpg', 'Gray cat found in Tokyo.', 'Mittens is very friendly and loves attention.', 'Hiroshi Yamamoto', '0', 'Domestic Shorthair', 'friendly, gray, small', 'en', '2024-09-20 10:00:00+00', true, '1597534862'),
	(1026, 'Rocky', 'dog', '+966523456789', true, 'open', 24.799584840013924, 46.678620604356745, 'https://random.dog/a4c781ee-23d2-4061-bc95-bfa0fa2ec358.mp4', 'Rottweiler lost in Riyadh.', 'Rocky is very friendly and may approach you.', 'Ameer AlHassan', '150', 'Rottweiler', 'friendly, large, rottweiler', 'ar', '2024-09-23 10:00:00+00', true, '4567891231'),
	(1027, 'Lucky', 'cat', '+966545678901', false, 'open', 28.98656954524527, 34.616819916783335, 'https://cdn2.thecatapi.com/images/ble.jpg', 'White cat found in Cairo.', 'Lucky is very friendly and loves to cuddle.', 'Layla Ahmed', '455', 'Persian', 'friendly, white, medium', 'ar', '2024-09-22 18:00:00+00', false, 'null'),
	(1028, 'Misty', 'cat', 'Emma_Johnson@yahoo.com', true, 'open', 33.99827809862148, -118.38848998613486, 'https://cdn2.thecatapi.com/images/mZZzMlywy.jpg', 'Gray cat lost in Los Angeles.', 'Misty is very shy and may be hiding.', 'Emma Johnson', '0', 'Domestic Shorthair', 'shy, gray, medium', 'en', '2024-09-23 08:00:00+00', true, '6547893210'),
	(1029, 'Buddy', 'dog', '+966501234567', true, 'open', 24.68526512652176, 46.54501218520198, 'https://random.dog/ee17f54a-83ac-44a3-8a35-e89ff7153fb4.jpg', 'Golden Retriever lost in Riyadh.', 'Buddy is friendly and loves to play.', 'Ali Al-Farsi', '0', 'Golden Retriever', 'friendly, golden, large', 'ar', '2024-09-20 10:00:00+00', true, '1234567890'),
	(1030, 'unknown', 'dog', '+966509876543', false, 'closed', 21.546416230945802, 39.72244714098207, 'https://random.dog/b3d18975-1146-457f-a95c-5eae994c2e9e.jpg', 'Beagle found in Jeddah.', 'dog is well taken care of.', 'Fatima Al-Rasheed', '0', 'Beagle', 'friendly, beagle, medium', 'ar', '2024-09-18 14:30:00+00', false, 'null'),
	(1031, 'Whiskers', 'cat', '+19414262565', true, 'open', 26.29749367356734, 50.11264377945775, 'https://cdn2.thecatapi.com/images/3qm.gif', 'Gray cat lost in Dammam.', 'Whiskers is very shy and may be hiding.', 'Sara Al-Mansour', '49', 'Domestic Shorthair', 'shy, gray, small', 'ar', '2024-09-22 12:00:00+00', true, '2589631470'),
	(1032, 'Tiger', 'cat', '+966531234567', false, 'closed', 26.37194547846409, 50.150203002673095, 'https://cdn2.thecatapi.com/images/eff.jpg', 'Tabby cat found in Khobar.', 'Tiger seems well cared for.', 'Mohammed Al-Hussein', '0', 'Tabby', 'friendly, tabby, medium', 'ar', '2024-09-21 15:00:00+00', false, 'null'),
	(1033, 'Luna', 'dog', 'Sophia.Smith47@hotmail.com', true, 'open', 34.15129722543748, -118.33107065020752, 'https://random.dog/1f647009-f9ae-4de0-bc1d-2ce9d00ecdbd.mp4', 'Labrador lost in Los Angeles.', 'Luna is very friendly and loves to fetch.', 'Sophia Smith', '0', 'Labrador', 'friendly, large, labrador', 'en', '2024-09-20 11:30:00+00', true, '9876543210'),
	(1034, 'Mittens', 'cat', 'Emily.Johnson76@yahoo.com', false, 'closed', 40.69994632440159, -74.01430736631049, 'https://cdn2.thecatapi.com/images/382.jpg', 'Black and white cat found in New York City.', 'Mittens is very friendly and loves attention.', 'Emily Johnson', '0', 'Domestic Shorthair', 'friendly, black and white, medium', 'en', '2024-09-18 10:00:00+00', false, 'null'),
	(1035, 'Rex', 'dog', '+966529876543', true, 'open', 29.949057934926547, 31.271826548813202, 'https://random.dog/7b18919b-ef82-4241-a17c-47220b4e362c.gif', 'German Shepherd lost in Cairo.', 'Rex is very loyal and protective.', 'Omar Ahmed', '0', 'German Shepherd', 'loyal, large, german shepherd', 'ar', '2024-09-21 09:00:00+00', true, '7412589630'),
	(1036, 'Bella', 'dog', 'Jean.Dupont67@gmail.com', false, 'closed', 48.85197891931135, 2.2842915474514482, 'https://random.dog/e83bd9a7-e2c8-409f-be27-5faf3983c2cc.gif', 'Poodle found in Paris.', 'Bella is very well trained.', 'Jean Dupont', '0', 'Poodle', 'friendly, small, poodle', 'fr', '2024-09-19 12:00:00+00', false, 'null'),
	(1037, 'Charlie', 'dog', 'Michael_Brown54@yahoo.com', true, 'open', 34.10541444102246, -118.41152199368395, 'https://random.dog/27ee3890-8eca-4038-b77e-b6630ebd3b74.jpg', 'Bulldog lost in Los Angeles.', 'Charlie is very friendly and loves attention.', 'Michael Brown', '0', 'Bulldog', 'friendly, medium, bulldog', 'en', '2024-09-23 08:00:00+00', true, '8529637410'),
	(1038, 'Socks', 'cat', '+17692332948', false, 'closed', 35.68161185383853, 139.58596997098905, 'https://cdn2.thecatapi.com/images/MjA3NTAyOQ.jpg', 'Tabby cat found in Tokyo.', 'Socks is very friendly.', 'Yuki Tanaka', '309', 'Tabby', 'friendly, tabby, medium', 'ja', '2024-09-18 10:00:00+00', false, 'null'),
	(1039, 'Chloe', 'cat', 'Olivia.Martinez@yahoo.com', true, 'open', 40.715504950021874, -74.00215396528961, 'https://cdn2.thecatapi.com/images/6ej.jpg', 'Black cat lost in New York City.', 'Chloe is very timid.', 'Olivia Martinez', '0', 'Siamese', 'shy, black, small', 'en', '2024-09-22 09:00:00+00', true, '3216549870'),
	(1040, 'Oliver', 'cat', 'Ivan_Petrov23@gmail.com', false, 'closed', 55.711070941924625, 37.57988977611471, 'https://cdn2.thecatapi.com/images/f5.jpg', 'Orange tabby found in Moscow.', 'Oliver is playful and friendly.', 'Ivan Petrov', '0', 'Tabby', 'playful, orange, medium', 'ru', '2024-09-19 12:00:00+00', false, 'null'),
	(1041, 'Daisy', 'dog', 'Giulia.Rossi36@yahoo.com', true, 'open', 41.86154932163121, 12.468845081617905, 'https://random.dog/631d7e1b-7887-468d-b27c-77f5e91e53d6.gif', 'Cocker Spaniel lost in Rome.', 'Daisy loves to chase squirrels.', 'Giulia Rossi', '0', 'Cocker Spaniel', 'friendly, small, cocker spaniel', 'it', '2024-09-21 11:30:00+00', true, '4561237890'),
	(1042, 'Nala', 'cat', 'Li.Wei8@hotmail.com', false, 'closed', 39.965719070340064, 116.39935703203476, 'https://cdn2.thecatapi.com/images/29b.jpg', 'White cat found in Beijing.', 'Nala is very calm and loving.', 'Li Wei', '0', 'Persian', 'calm, white, medium', 'zh', '2024-09-20 10:00:00+00', false, 'null'),
	(1043, 'Rocky', 'dog', 'Ravi_Kumar@yahoo.com', true, 'open', 28.533232367593595, 77.12136720794099, 'https://random.dog/33f7e72c-7031-47f3-8b67-9dfdfb80c48c.jpg', 'Rottweiler lost in New Delhi.', 'Rocky is very protective and loyal.', 'Ravi Kumar', '0', 'Rottweiler', 'protective, large, rottweiler', 'hi', '2024-09-21 15:00:00+00', true, '3692581470'),
	(1044, 'Milo', 'dog', 'James.Smith@gmail.com', false, 'closed', 51.487596175640164, -0.21245673485896038, 'https://random.dog/8adc2518-3d07-4d05-abf5-7206aba4989c.jpg', 'French Bulldog found in London.', 'Milo is well cared for.', 'James Smith', '0', 'French Bulldog', 'friendly, small, bulldog', 'en', '2024-09-19 12:00:00+00', false, 'null'),
	(1045, 'Sadie', 'dog', '+19655130197', true, 'open', 34.05968541413226, -118.22547102439925, 'https://random.dog/5f2228be-01e8-421a-9fc3-47b9daa4740b.jpg', 'Dachshund lost in Los Angeles.', 'Sadie loves to chase birds.', 'Lisa Anderson', '0', 'Dachshund', 'playful, small, dachshund', 'en', '2024-09-20 11:00:00+00', true, '1472583690'),
	(1046, 'Simba', 'cat', '+14318281749', false, 'closed', 37.686140582499846, -122.54438098433704, 'https://cdn2.thecatapi.com/images/88j.gif', 'Orange cat found in San Francisco.', 'Simba is very playful.', 'Emma White', '385', 'Maine Coon', 'playful, orange, large', 'en', '2024-09-18 10:00:00+00', false, 'null'),
	(1047, 'Toby', 'dog', '+15883970491', true, 'open', 48.85415496877392, 2.261587614518416, 'https://random.dog/151d0e72-38b2-41c8-9edf-152540c4a0f1.mp4', 'Beagle lost in Paris.', 'Toby is very friendly.', 'Chloe Martin', '0', 'Beagle', 'friendly, small, beagle', 'fr', '2024-09-23 08:30:00+00', true, '7894561230'),
	(1048, 'Bella', 'cat', '+14603815863', false, 'closed', 34.01498389110305, -118.21921205273289, 'https://cdn2.thecatapi.com/images/ShbKwvcD_.jpg', 'Black and white cat found in Los Angeles.', 'Bella is very playful.', 'Sophia Taylor', '0', 'Domestic Shorthair', 'playful, black and white, medium', 'en', '2024-09-19 12:00:00+00', false, 'null'),
	(1049, 'Gizmo', 'cat', 'John.Doe@yahoo.com', true, 'open', 37.893628832885256, -122.4368633788789, 'https://cdn2.thecatapi.com/images/b5k.gif', 'Siamese cat lost in San Francisco.', 'Gizmo is very shy and may be hiding.', 'John Doe', '0', 'Siamese', 'shy, siamese, small', 'en', '2024-09-21 10:00:00+00', true, '6547893210'),
	(1050, 'Charlie', 'dog', '+16494430596', false, 'closed', 19.511584581552174, -99.06192232447584, 'https://random.dog/61315d88-8e08-46ff-996b-5d6c2696c14d.gif', 'Chihuahua found in Mexico City.', 'Charlie is very playful.', 'Maria Gonzalez', '0', 'Chihuahua', 'playful, small, chihuahua', 'es', '2024-09-18 10:00:00+00', false, 'null'),
	(1051, 'Lola', 'dog', '+18247556821', true, 'open', 51.626161192815594, -0.1338585878333265, 'https://random.dog/84cd21fe-6185-4b55-b075-7bc1418bf731.jpg', 'Golden Retriever lost in London.', 'Lola is very friendly.', 'George Smith', '0', 'Golden Retriever', 'friendly, large, golden retriever', 'en', '2024-09-23 11:00:00+00', true, '4567893210'),
	(1052, 'Coco', 'cat', '+18337902540', false, 'closed', 48.96351955003182, 2.386468863749584, 'https://cdn2.thecatapi.com/images/9t4.jpg', 'Persian cat found in Paris.', 'Coco is well taken care of.', 'Marie Dupont', '0', 'Persian', 'friendly, persian, medium', 'fr', '2024-09-20 10:00:00+00', false, 'null'),
	(1053, 'Rocky', 'dog', '+17228074628', true, 'open', 34.09907561605072, -118.36230869258816, 'https://random.dog/529985ad-9d89-44c1-94cd-d0059bc628e5.mp4', 'Beagle lost in Los Angeles.', 'Rocky is very friendly.', 'Emily Clarke', '82', 'Beagle', 'friendly, medium, beagle', 'en', '2024-09-22 12:00:00+00', true, '7894561230'),
	(1054, 'unknown', 'cat', '+13666471753', false, 'closed', 51.519784806263516, -0.17826765126672592, 'https://cdn2.thecatapi.com/images/nv.jpg', 'British Shorthair found in London.', 'cat is very affectionate.', 'Anna Williams', '0', 'British Shorthair', 'affectionate, small, shorthair', 'en', '2024-09-19 12:00:00+00', false, 'null'),
	(1055, 'Baxter', 'dog', '+12377853936', true, 'open', 33.98415158419122, -118.16320527261188, 'https://random.dog/2b9be14d-f084-4cbc-a266-35cc02ff62e9.gif', 'Golden Retriever lost in Los Angeles.', 'Baxter is friendly and loves to play.', 'David Johnson', '426', 'Golden Retriever', 'friendly, large, golden', 'en', '2024-09-23 10:00:00+00', true, '3216549870'),
	(1056, 'Leo', 'cat', 'Elena_Rossi@yahoo.com', false, 'closed', 41.877956815235166, 12.360192690711253, 'https://cdn2.thecatapi.com/images/9u0.jpg', 'Siamese cat found in Rome.', 'Leo is friendly and loves to cuddle.', 'Elena Rossi', '0', 'Siamese', 'friendly, siamese, medium', 'it', '2024-09-18 10:00:00+00', false, 'null'),
	(1057, 'Ziggy', 'dog', '+16263053821', true, 'open', 41.063534434266806, 29.05143026714816, 'https://random.dog/1f647009-f9ae-4de0-bc1d-2ce9d00ecdbd.mp4', 'Poodle lost in Istanbul.', 'Ziggy is very playful.', 'Mert YÃ„Â±lmaz', '0', 'Poodle', 'playful, medium, poodle', 'tr', '2024-09-20 12:00:00+00', true, '2589631470'),
	(1058, 'unknown', 'cat', '+14944868769', false, 'closed', 55.802295812120185, 37.52481550518283, 'https://cdn2.thecatapi.com/images/e4q.jpg', 'British Shorthair found in Moscow.', 'cat is very playful.', 'Anastasia Ivanova', '0', 'British Shorthair', 'playful, medium, shorthair', 'ru', '2024-09-19 12:00:00+00', false, 'null'),
	(1059, 'Milo', 'dog', '+966561234567', true, 'open', 24.775875225142258, 46.61668282705563, 'https://random.dog/42a98d03-5ed7-4b3b-af89-7c4876cb14c3.jpg', 'Brown Labrador lost in Riyadh.', 'Milo is very friendly.', 'Ahmed Al-Farsi', '0', 'Labrador', 'friendly, medium, labrador', 'ar', '2024-09-01 10:00:00+00', true, '1234567890'),
	(1060, 'Whiskers', 'cat', '+966512345678', false, 'closed', 21.307623389680625, 39.828906086505754, 'https://cdn2.thecatapi.com/images/9l8.jpg', 'Found white Persian cat in Jeddah.', 'Whiskers loves to cuddle.', 'Fatima Al-Harbi', '0', 'Persian', 'friendly, persian, small', 'ar', '2024-09-02 11:00:00+00', false, 'null'),
	(1061, 'Buddy', 'dog', '+966521234567', true, 'open', 26.42337148045178, 49.98003525940998, 'https://random.dog/d40de385-3626-46c8-94bf-b7097226174f.jpg', 'Golden Retriever lost in Dammam.', 'Buddy is very playful.', 'Mohammed Al-Qasim', '0', 'Golden Retriever', 'playful, large, golden retriever', 'ar', '2024-09-03 12:00:00+00', true, '0987654321'),
	(1062, 'Luna', 'cat', '+966530987654', false, 'closed', 26.252362562818952, 50.20897941313437, 'https://cdn2.thecatapi.com/images/MTgyMDg1NQ.jpg', 'Black cat found in Khobar.', 'Luna is very shy.', 'Sara Al-Otaibi', '0', 'Sphynx', 'shy, black, medium', 'ar', '2024-09-04 10:00:00+00', false, 'null'),
	(1063, 'Rocky', 'dog', 'John_Smith@gmail.com', true, 'open', 40.76602672721174, -74.15827640857505, 'https://random.dog/1d9b4b44-e168-4b18-80d0-4919ad0e6fab.jpg', 'Beagle lost in New York.', 'Rocky is very friendly.', 'John Smith', '0', 'Beagle', 'friendly, medium, beagle', 'en', '2024-09-05 09:00:00+00', true, '4567891230'),
	(1064, 'Coco', 'cat', 'Jane.Doe73@yahoo.com', false, 'closed', 34.19613663533171, -118.2477239499968, 'https://cdn2.thecatapi.com/images/vDFI6jI2O.jpg', 'Tabby cat found in Los Angeles.', 'Coco is very playful.', 'Jane Doe', '0', 'Tabby', 'playful, tabby, medium', 'en', '2024-09-06 08:00:00+00', false, 'null'),
	(1065, 'Bella', 'cat', '+17155801320', true, 'open', 51.49824631400674, -0.10152689833166763, 'https://cdn2.thecatapi.com/images/7c.gif', 'Black and white cat lost in London.', 'Bella is very shy.', 'Emily White', '0', 'Domestic Shorthair', 'shy, black and white, small', 'en', '2024-09-07 07:00:00+00', true, '7894561230'),
	(1066, 'Max', 'dog', '+18193279480', false, 'closed', 48.958290821541176, 2.286129589397921, 'https://random.dog/19d5812f-127c-49a8-84ee-ee684dcf0a1f.jpg', 'Golden Retriever found in Paris.', 'Max is very playful.', 'Jean Dupont', '0', 'Golden Retriever', 'playful, large, golden retriever', 'fr', '2024-09-08 06:00:00+00', false, 'null'),
	(1067, 'Toby', 'dog', 'Kenji_Tanaka@yahoo.com', true, 'open', 35.86706177560045, 139.5395940145505, 'https://random.dog/8b48bc81-16fd-4d1d-b593-1d671107ca5a.jpg', 'Shiba Inu lost in Tokyo.', 'Toby is very friendly.', 'Kenji Tanaka', '0', 'Shiba Inu', 'friendly, medium, shiba', 'ja', '2024-09-09 11:00:00+00', true, '3216549870'),
	(1068, 'Gizmo', 'cat', 'Alice_Johnson57@gmail.com', false, 'closed', 40.77532611322621, -73.92561489963556, 'https://cdn2.thecatapi.com/images/MTk3MjE1Mw.jpg', 'Siamese cat found in New York.', 'Gizmo is very vocal.', 'Alice Johnson', '0', 'Siamese', 'vocal, siamese, small', 'en', '2024-09-10 10:00:00+00', false, 'null'),
	(1069, 'Charlie', 'dog', '+966500000000', true, 'open', 30.05610925125598, 31.162672872058327, 'https://random.dog/1abd3cbd-d6db-435b-9218-a9b6a26be50b.JPG', 'Beagle lost in Cairo.', 'Charlie loves to run.', 'Ahmed Salah', '0', 'Beagle', 'active, medium, beagle', 'ar', '2024-09-11 09:00:00+00', true, '2345678901'),
	(1070, 'Sasha', 'cat', 'Hans.MA16dg4ller32@hotmail.com', false, 'closed', 52.60047137068998, 13.334570367263623, 'https://cdn2.thecatapi.com/images/c2r.jpg', 'Grey cat found in Berlin.', 'Sasha is very quiet.', 'Hans MÃƒÂ¼ller', '351', 'European Shorthair', 'quiet, grey, medium', 'de', '2024-09-12 08:00:00+00', false, 'null'),
	(1071, 'Daisy', 'dog', 'Li.Wei13@yahoo.com', true, 'open', 1.3408662850964406, 103.81964564739948, 'https://random.dog/c51308bb-bbff-4db2-98e7-a3711eafb598.jpg', 'Shih Tzu lost in Singapore.', 'Daisy is very friendly.', 'Li Wei', '0', 'Shih Tzu', 'friendly, small, shih tzu', 'zh', '2024-09-13 07:00:00+00', true, '5678901234'),
	(1072, 'Loki', 'cat', 'Emily.Johnson@yahoo.com', false, 'closed', -33.393530507931494, 151.2793760995287, 'https://cdn2.thecatapi.com/images/MjAzNTEwNA.jpg', 'Tabby cat found in Sydney.', 'Loki is very curious.', 'Emily Johnson', '0', 'Tabby', 'curious, tabby, medium', 'en', '2024-09-14 06:00:00+00', false, 'null'),
	(1073, 'Roxy', 'dog', '+19279683506', true, 'open', 55.90204886301827, 37.572394340993334, 'https://random.dog/474feef3-7ccf-4aff-94e5-9ad5a8b65a48.jpg', 'Bulldog lost in Moscow.', 'Roxy is very friendly.', 'Anastasia Ivanova', '20', 'Bulldog', 'friendly, medium, bulldog', 'ru', '2024-09-15 11:00:00+00', true, '9876543210'),
	(1074, 'unknown', 'cat', '+16918176929', false, 'closed', 22.484737488736947, 114.11696318682938, 'https://cdn2.thecatapi.com/images/bkg.jpg', 'Siamese cat found in Hong Kong.', 'cat is very affectionate.', 'Li Mei', '146', 'Siamese', 'affectionate, siamese, small', 'zh', '2024-09-16 10:00:00+00', false, 'null'),
	(1075, 'Zara', 'dog', 'Michael.Smith35@gmail.com', true, 'open', 34.07853695538874, -118.26612643797932, 'https://random.dog/b780466a-d547-45db-9168-924e3dc485ea.jpg', 'Poodle lost in Los Angeles.', 'Zara is very playful.', 'Michael Smith', '0', 'Poodle', 'playful, medium, poodle', 'en', '2024-09-17 08:00:00+00', true, '1597534862'),
	(1076, 'Shadow', 'cat', 'Carlos_Ruiz68@gmail.com', false, 'closed', 19.528965317040825, -99.17114803651606, 'https://cdn2.thecatapi.com/images/bcj.jpg', 'Black cat found in Mexico City.', 'Shadow is very mysterious.', 'Carlos Ruiz', '0', 'Domestic Shorthair', 'mysterious, black, medium', 'es', '2024-09-18 12:00:00+00', false, 'null'),
	(1077, 'Bella', 'dog', '+12589563796', true, 'open', 49.01844065840449, 2.3608263142242847, 'https://random.dog/688a931c-7065-48b1-b4b4-5782954abd81.mp4', 'Beagle lost in Paris.', 'Bella is very energetic.', 'Sophie Dubois', '0', 'Beagle', 'energetic, medium, beagle', 'fr', '2024-09-19 09:00:00+00', true, '2468101214'),
	(1078, 'Mittens', 'cat', '+14785422591', false, 'closed', 55.86180393841629, 37.54234983531214, 'https://cdn2.thecatapi.com/images/cpb.jpg', 'Calico cat found in Moscow.', 'Mittens is very friendly.', 'Dmitry Ivanov', '0', 'Calico', 'friendly, calico, medium', 'ru', '2024-09-20 08:00:00+00', false, 'null'),
	(1079, 'Fido', 'dog', 'Jessica.Brown@gmail.com', true, 'open', -34.87087338617047, 138.52918578774623, 'https://random.dog/2b77b03c-3073-454e-957b-867580b3d005.jpg', 'Golden Retriever lost in Adelaide.', 'Fido is very loyal.', 'Jessica Brown', '496', 'Golden Retriever', 'loyal, large, golden retriever', 'en', '2024-09-21 07:00:00+00', true, '3333333333'),
	(1080, 'Chester', 'cat', 'Aidan.MacLeod16@hotmail.com', false, 'closed', 55.99257775710584, -3.23061180775213, 'https://cdn2.thecatapi.com/images/MTY2Mjg0MA.jpg', 'Orange tabby cat found in Edinburgh.', 'Chester is very sweet.', 'Aidan MacLeod', '0', 'Tabby', 'sweet, orange, medium', 'en', '2024-09-22 06:00:00+00', false, 'null'),
	(1081, 'Bruno', 'dog', 'Maria.Garcia@gmail.com', true, 'open', 37.868346847913664, -122.5084962709341, 'https://random.dog/d242b545-ad14-42c9-8671-1e368a9672f0.jpg', 'Rottweiler lost in San Francisco.', 'Bruno is very protective.', 'Maria Garcia', '0', 'Rottweiler', 'protective, large, rottweiler', 'en', '2024-09-23 12:00:00+00', true, '1231231230'),
	(1082, 'Oliver', 'cat', '+14763241072', false, 'closed', 34.200759161410815, -118.26810831452353, 'https://cdn2.thecatapi.com/images/6ki.jpg', 'Grey cat found in Los Angeles.', 'Oliver is very laid back.', 'Sarah Connor', '0', 'Russian Blue', 'laid back, grey, medium', 'en', '2024-09-24 11:00:00+00', false, 'null'),
	(1083, 'Bella', 'dog', '+18374134004', true, 'open', 52.48924573738804, 13.49251074795124, 'https://images.dog.ceo/breeds/rottweiler/n02106550_6424.jpg', 'Bulldog lost in Berlin.', 'Bella loves to eat.', 'Tom Schmidt', '0', 'Bulldog', 'friendly, medium, bulldog', 'de', '2024-09-25 10:00:00+00', true, '3216549873'),
	(1084, 'Leo', 'cat', 'Anna_Brown99@yahoo.com', false, 'closed', -37.86544039045916, 144.91271176776723, 'https://cdn2.thecatapi.com/images/57j.jpg', 'Bengal cat found in Melbourne.', 'Leo is very energetic.', 'Anna Brown', '128', 'Bengal', 'energetic, bengal, medium', 'en', '2024-09-26 09:00:00+00', false, 'null'),
	(1085, 'Buster', 'dog', 'Nina_Roberts76@yahoo.com', true, 'open', 56.00720533698827, -3.296850334293452, 'https://images.dog.ceo/breeds/basenji/n02110806_4058.jpg', 'Cocker Spaniel lost in Edinburgh.', 'Buster is very friendly.', 'Nina Roberts', '0', 'Cocker Spaniel', 'friendly, medium, spaniel', 'en', '2024-09-27 08:00:00+00', true, '6543217890'),
	(1086, 'Cleo', 'cat', 'Carlos_Silva@gmail.com', false, 'closed', -22.835730531612413, -43.08368863208413, 'https://cdn2.thecatapi.com/images/dk0.jpg', 'White cat found in Rio de Janeiro.', 'Cleo is very sweet.', 'Carlos Silva', '0', 'Siamese', 'sweet, white, medium', 'pt', '2024-09-28 11:00:00+00', false, 'null'),
	(1087, 'Holly', 'dog', '+14833057442', true, 'open', 35.59107817416914, 139.64295755650596, 'https://images.dog.ceo/breeds/cattledog-australian/IMG_5481.jpg', 'Golden Retriever lost in Tokyo.', 'Holly is very friendly.', 'Takashi Nakamura', '0', 'Golden Retriever', 'friendly, large, golden retriever', 'ja', '2024-09-29 10:00:00+00', true, '1112223333'),
	(1088, 'Ginger', 'cat', '+18078520505', false, 'closed', 35.816031886749435, 139.70505047470579, 'https://cdn2.thecatapi.com/images/ajv.jpg', 'Calico cat found in Tokyo.', 'Ginger is very playful.', 'Akira Tanaka', '0', 'Calico', 'playful, calico, medium', 'ja', '2024-09-30 12:00:00+00', false, 'null'),
	(1009, 'Nina', 'cat', '+15799841352', false, 'open', 37.7021225332421, -122.48615353382199, 'https://cdn2.thecatapi.com/images/b3p.jpg', 'Calico cat found in San Francisco.', 'Nina was found wandering near the pier.', 'Maria Garcia', '0', 'Calico', 'friendly, small, calico', 'en', '2024-09-23 15:00:00+00', false, 'null') ON CONFLICT DO NOTHING;
--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."reports" ("id", "created_at", "caseId", "name", "contact", "reportLatitude", "reportLongitude", "isPetFoundReport", "language", "isCaseReviewed", "imageUrl", "message", "petType") VALUES
	(1, '2024-09-25 13:39:30.178751+00', 1009, 'Ali', 'ali@tuwaiqtracker.com', 37.70482825, 50.70482825, true, 'ar, en', false, NULL, 'hello I found this pet near the costco, he''s still there', 'dog') ON CONFLICT DO NOTHING;
--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

--
-- Name: Test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

--
-- Name: pets_caseId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."pets_caseId_seq"', 5, true);
--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."reports_id_seq"', 13, true);
--
-- PostgreSQL database dump complete
--

RESET ALL;
