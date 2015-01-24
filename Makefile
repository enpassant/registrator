NAME=registrator
HARDWARE=$(shell uname -m)
VERSION=0.4.1

build: package
	docker build -t enpassant/registrator .

package:
	rm -rf release
	mkdir release
	GOOS=darwin godep go build -o release/$(NAME)
	cd release && tar -zcf $(NAME)_$(VERSION)_darwin_$(HARDWARE).tgz $(NAME)
	GOOS=linux godep go build -o release/$(NAME)
	cd release && tar -zcf $(NAME)_$(VERSION)_linux_$(HARDWARE).tgz $(NAME)

release:
	rm release/$(NAME)
	echo "$(VERSION)" > release/version
	echo "enpassant/$(NAME)" > release/repo
	gh-release create enpassant/$(NAME) $(VERSION)

.PHONY: release
