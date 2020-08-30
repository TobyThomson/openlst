# OpenLST
# Copyright (C) 2018 Planet Labs Inc.
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

RADIOS += HEXSAT-LST
BOOTLOADERS += HEXSAT-LST
HEXSAT-LST_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

# Source files
HEXSAT-LST_SRCS := \
	$(HEXSAT-LST_DIR)/board.c

HEXSAT-LST_CFLAGS := -DCUSTOM_BOARD_INIT -I$(HEXSAT-LST_DIR)

# Disable UART0 in the bootloader to save space
#HEXSAT-LST_BOOTLOADER_CFLAGS := -DUART0_ENABLED=0