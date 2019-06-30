#' Parse Telegram chat history files (WIP)
#'
#' @param chat_dir Directory where the Chat History was saved
#'
#' @return lines of messages
#'
#' @export
#'
#' @examples
#' parse_chat_history("chat_history")
parse_chat_history <- function(chat_dir) {
  file_list <- list.files(path = chat_dir, pattern = "html$")

  messages <- paste(chat_dir, file_list, sep ="/") %>%
    sapply(readLines) %>%
    unlist() %>%
    stringr::str_c(collapse = "") %>%
    stringr::str_split("from_name") %>%
    unlist()

  return(messages)
}
