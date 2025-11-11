REVOKE ALL ON FUNCTION public.get_chat_list_items(bigint) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_chat_list_items(bigint) TO anon, authenticated;