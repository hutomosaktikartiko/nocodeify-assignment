REVOKE ALL ON FUNCTION public.mark_messages_as_read(UUID, BIGINT) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.mark_messages_as_read(UUID, BIGINT) TO anon, authenticated;