/+  server, schooner, sio=strandio
/*  form  %html  /form/html
::
=*  bowl  bowl:gall
=*  card  card:agent:gall
=*  name-term  %bucket
=*  name-mold  $bucket
=*  data-desk  %bucket-data
=/  strand  strand:rand
=/  our-url    (rap 3 '/apps/' name-term '/' ~)
|%
++  fmap-thread
  |*  [gat=gate r=(strand-form-raw:rand *)]
  |=  tin=strand-input:rand
  =*  this  .
  =/  res  (r tin)
  :-  cards.res
  ?+  -.next.res  next.res
    %done  [%done (gat value.next.res)]
    %cont  [%cont this(r self.next.res)]
  ==
::
++  write-file
  |=  [=path =mark =vase]
  ^-  (strand-form-raw:rand ~)
  =/  c  [%pass / %arvo [%c [%info data-desk %& [path %ins mark vase]~]]]
  (send-raw-card:sio c)
::
++  save-file
  |=  [name=@tas extension=@tas public=? mime-type=@t data=octs]
  ^-  shed:khan
  %+  fmap-thread  |=(* !>(~))
  =/  m  (strand ,~)
  ^-  form:m
  ;<  bol=bowl:rand  bind:m  get-bowl:sio
  =/  beak  [our.bol data-desk %da now.bol]
  ;<  ~  bind:m
    ;<  have-mark=?  bind:m  (check-for-file:sio beak /mar/[extension]/hoon)
    ?:  have-mark  (pure:m ~)
    =/  src=@t
      %-  crip
      """
      /+  make-octets-mark
      (make-octets-mark {(trip mime-type)})
      """
    ::
    (write-file /mar/[extension]/hoon %hoon !>(src))
  ::
  =/  pax=path  /[?:(public 'public' 'private')]/[name]/[extension]
  ;<  =tube:clay  bind:m  (build-tube:sio beak %mime extension)
  (write-file pax extension (tube !>([*mite data])))
::
++  mage
  |=  [our=@p now=@da]
  |=  =path
  :-  path
  ^-  page:clay
  :-  (rear path)
  ~|  [%missing-source-file name-term path]
  .^  *
    %cx
    (scot %p our)
    name-term
    (scot %da now)
    path
  ==
--
::
^-  agent:gall
|_  =bowl
+*  this  .
++  on-init
  =/  files=(map path page)
    %-  malt
    ^-  (list [path page])
    =-  (turn - (mage our.bowl now.bowl))
    ^-  (list path)
    :~  /mar/noun/hoon
        /mar/hoon/hoon
        /mar/txt/hoon
        /mar/kelvin/hoon
        /sys/kelvin
        /mar/mime/hoon
        /lib/make-octets-mark/hoon
    ==
  ::
  :_  this
  :~
    [%pass /clay/data-desk %arvo (new-desk:cloy data-desk ~ files)]
    [%pass /eyre/connect %arvo %e %connect `/apps/[name-term] name-term]
  ::
    [ %pass
      /hood/public
      %agent
      [our.bowl %hood]
      %poke
      %kiln-permission
      !>([data-desk /public &])
    ]
  ==
::
++  on-save  *vase
++  on-load  _`this
++  on-poke
  |=  [=mark =vase]
  ^-  [(list card) _this]
  ?>  =(src.bowl our.bowl)
  :_  this
  ^-  (list card)
  ?.  ?=(%handle-http-request mark)
    ~|  [%strange-poke mark]
    !!
  =+  !<([eyre-id=@ta =inbound-request:eyre] vase)
  =/  =request-line:server
    (parse-request-line:server url.request.inbound-request)
  ::
  =+  send=(cury response:schooner eyre-id)
  ?+    method.request.inbound-request  (send [405 ~ [%stock ~]])
      ?(%'GET' %'POST')
    =/  site=(pole knot)  site.request-line
    ?+    site  (send [404 ~ [%plain "404 - Not Found"]])
        ?([%apps name-mold ~] [%'~' name-mold ~])
      (send 302 ~ [%redirect our-url])
    ::
        [%apps name-mold %$ ~]
      ?.  authenticated.inbound-request
        (send [302 ~ [%login-redirect our-url]])
      %+  give-simple-payload:app:server  eyre-id
      :-  :-  200
          ['content-type'^'text/html']~
      `(as-octs:mimes:html form)
    ::
        [%apps name-mold %upload ~]
      ?.  authenticated.inbound-request  ~
      ?~  body.request.inbound-request   ~
      =/  headers=(map @t @t)  (malt header-list.request.inbound-request)
      =/  name-ext=@t  (~(got by headers) 'x-filename')
      =/  [name=@tas extension=@tas]
        %+  rash  name-ext
        ;~  pose
          ;~((glue dot) sym sym)
          ;~(plug sym (easy %data))
        ==
      ::
      =/  public=?  =('1' (~(got by headers) 'x-public'))
      =/  mime-type=@t  (cat 3 '/' (~(got by headers) 'content-type'))
      =/  data=octs  u.body.request.inbound-request
      =/  shed  (save-file name extension public mime-type data)
      :-  [%pass /bucket/save %arvo %k %lard name-term shed]
      (send [200 ~ plain+"OK"])
    ==
  ==
::
++  on-peek   _~
++  on-watch  _`this
++  on-arvo   _`this
++  on-agent  _`this
++  on-fail   _`this
++  on-leave  _`this
--