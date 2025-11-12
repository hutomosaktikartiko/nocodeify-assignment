CREATE POLICY messages_select_all
ON public.messages
FOR SELECT
TO anon, authenticated
USING (true);

CREATE POLICY messages_insert_all
ON public.messages
FOR INSERT
TO anon, authenticated
WITH CHECK (true);