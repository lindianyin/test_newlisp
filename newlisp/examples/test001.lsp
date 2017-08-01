(set 'files '(
              "C:/Program Files/gnuwin32/bin/libeay32.dll" ; XP
              "C:/Program Files (x86)/gnuwin32/bin/libeay32.dll" ; 7 
              "/usr/lib/x86_64-linux-gnu/libcrypto.so" ; Ubuntu 12.04 LTS
              "/usr/lib/i386-linux-gnu/libcrypto.so"; Ubuntu 12.04
              "/lib/i386-linux-gnu/libcrypto.so.1.0.0" ; UBUNTU Linux 13.04
              "/usr/lib64/libcrypto.so" ; Fedora, CentOS 6.x
              "/usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.0" ; Debian jessie
              "/usr/lib/libcrypto.so"
              "/usr/lib/libcrypto.so.4"
              "/usr/lib/libcrypto.so.18.0" ; OpenBSD 4.6
              "/usr/lib/libcrypto.so.19.0" ; OpenBSD 5.0
              "/usr/lib/libcrypto.dylib"
              ))

(set 'library (files (or 
                      (find true (map file? files))
                      (throw-error "cannot find crypto library"))))

(set 'option (if (= ostype "Windows") "cdecl"))

(import library "MD5" option)
(import library "RIPEMD160" option)
(import library "SHA1" option)
(import library "SHA256" option)

(set 'str "hello")

(set 'ss (join (map (lambda (x) (format "%02x" (& x 0xff))) 
		(unpack (dup "c" 16 ) (MD5 str (length str) 0)))))
;(println ss)

(define (sum-sq a b)
	;(let ( (x (* a a)) (y (* b b) ))
	(let ( x (* a a)  y (* b b) )
        (+ x y)))

;(println (sum-sq 3 4))
(set 'LUA_SO "/home/lindianyin/lua-5.3.3/src/liblua.so")

(import LUA_SO "luaL_newstate")
(import LUA_SO "luaL_loadstring")
(import LUA_SO "luaL_openlibs")
(import LUA_SO "lua_close")
(import LUA_SO "lua_pcallk")
(import LUA_SO "lua_gettop")
(import LUA_SO "lua_getglobal")
(import LUA_SO "lua_rotate")
(import LUA_SO "luaL_checkstack")
(import LUA_SO "lua_settop")
(import LUA_SO "lua_pushnumber")
(import LUA_SO "lua_pushstring")
(import LUA_SO "lua_isnumber")
(import LUA_SO "lua_isstring")
(import LUA_SO "lua_tonumberx")
(import LUA_SO "lua_tolstring")

(define (lua_pcall L n r f)
    (lua_pcallk L n r f 0 0))

(define (lua_insert L idx) 
    (lua_rotate L idx 1))

(define (lua_tonumber L idx)
	(lua_tonumberx L idx 0))

(define (lua_tostring L idx)
	(lua_tolstring L idx 0))

;;/*
;;** Prints (calling the Lua 'print' function) any values on the stack
;;*/
;;static void l_print (lua_State *L) {
;;  int n = lua_gettop(L);
;;  if (n > 0) {  /* any result to be printed? */
;;    luaL_checkstack(L, LUA_MINSTACK, "too many results to print");
;;    lua_getglobal(L, "print");
;;    lua_insert(L, 1);
;;    if (lua_pcall(L, n, 0, 0) != LUA_OK)
;;      l_message(progname, lua_pushfstring(L, "error calling 'print' (%s)",
;;                                             lua_tostring(L, -1)));
;;  }
;;}


(define (lua_printstack L)
    (let (n (lua_gettop L))  (when (> n 0) (begin (lua_getglobal L "print") (lua_insert L 1) (lua_pcall L n 0 0 )))))


(define (lua_dostring L str)
    (if (= 0 (luaL_loadstring L str)) 
	(if (= 0 (lua_pcallk L 0 -1 0 0 0 )) (lua_printstack L)  (throw "error pcallk"))
	(throw (append "error lua " str))))


(set 'L (luaL_newstate))
;(println L)
(luaL_openlibs L)
;;(println (luaL_loadstring L "print(\"hello lua\")"))
;;(if (= 0 (luaL_loadstring L "print(\"hello lua\")")) (lua_pcallk L 0 -1 0 0 0 ) (throw "error lua") )
;;(catch (lua_dostring L "print(1,2,3,)"))
(lua_dostring L "return 10, 20")
;(lua_printstack L)

(println (when (starts-with "this is useful" "this") "have"))

(println (sort '(".." "..." "." ".....") (fn (x y) (< (length x) (length y)))))

(println ((lambda (x) (* x x)) 10))
(println ((fn (x) (* x x)) 10))

(for (i 1 10 1 (= i 5)) (println i))


(lua_dostring L "return table.concat({'aa','bb'},',')")
(println (nth 1 (first lua_dostring)))

(define (myadd)
	(apply add (args)))

(println (myadd 1 2 3 4))



(lua_close L)
(exit)
