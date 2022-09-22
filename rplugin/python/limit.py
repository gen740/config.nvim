import pynvim
import requests


# @pynvim.plugin
# class Limit(object):
#     def __init__(self, vim: pynvim.Nvim):
#         self.vim = vim
#         self.calls = 0
#
#     @pynvim.command("Cmd", range="", nargs="*", sync=True)
#     def command_handler(self, args, range):
#         self._increment_calls()
#         self.vim.current.line = "Command: Called %d times, args: %s, range: %s" % (
#             self.calls,
#             args,
#             range,
#         )
#
#     # @pynvim.autocmd("BufEnter", pattern="*.py", eval='expand("<afile>")', sync=True)
#     # def autocmd_handler(self, filename):
#     #     self._increment_calls()
#     #     self.vim.current.line = "Autocmd: Called %s times, file: %s" % (
#     #         self.calls,
#     #         filename,
#     #     )
#
#     @pynvim.function("Func")
#     def function_handler(self, args):
#         print(args)
#         self.vim.command("echo 'Test'")
#         # self._increment_calls()
#         # self.vim.current.line = "Function: Called %d times, args: %s" % (
#         #     self.calls,
#         #     args,
#         # )
#
#     def _increment_calls(self):
#         if self.calls == 5:
#             raise Exception("Too many calls!")
#         self.calls += 1


@pynvim.plugin
class UpdateCheck(object):

    """Docstring for UpdateCheck."""

    def __init__(self):
        """TODO: to be defined."""
