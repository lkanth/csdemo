########################################################################################################################
#!!
#! @description: Generated Python operation description.
#!
#! @input text: Generated description
#!
#! @result SUCCESS: Operation completed successfully.
#!!#
########################################################################################################################

namespace: demo.base

operation:
  name: print

  inputs:
    - text

  python_action:
    script: |
      print text

  results:
    - SUCCESS