{  pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
(pkgs.st.overrideAttrs (_:{
  src = ../Config/st;
  patches = [];

}))

(pkgs.dmenu.overrideAttrs (_:{
  src = ../Config/dmenu;
  patches = [];

}))

slock
  ];
}
