#!/bin/sh

# take any PDF file and print the odd pages first
# THEN, ask the user to put the paper back in the printer, face down
# THEN, print even pages

# take the default printer from the cups configuration
# OR manually set it

# NOTE: assuming the pages are in portrait mode
# if not, then I should add a flag to correct that

. _APPLICATION_CONFIG_PATH_

_PRINTER=$(grep DefaultPrinter -i $_CUPS_PATH/printers.conf | awk {'print$2'} | sed -e "s/>//")

if [ "$#" -lt "1" ]
then
  echo -e "Document to print is required."
  exit 1
fi

_print() {
  $_LPR -P $_PRINTER -o $@ "$_DOCUMENT"
}