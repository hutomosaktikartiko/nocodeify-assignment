CREATE OR REPLACE FUNCTION mark_messages_as_read(p_room_id UUID, p_viewer_id BIGINT)
RETURNS void
SECURITY DEFINER
SET search_path = public
AS $$
    UPDATE public.messages m
    SET is_read = true
    WHERE m.room_id = p_room_id
        AND m.sender_id <> p_viewer_id
        AND m.is_read = false
        AND EXISTS (
            SELECT 1
            FROM public.rooms r
            WHERE r.id = p_room_id
                AND (r.participant_1_id = p_viewer_id OR r.participant_2_id = p_viewer_id)
        );
$$ LANGUAGE sql;

REVOKE ALL ON FUNCTION public.mark_messages_as_read(UUID, BIGINT) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.mark_messages_as_read(UUID, BIGINT) TO anon, authenticated;