
final: prev: {
  waypaper = prev.waypaper.overrideAttrs (oldAttrs: {
    version = "2.9";

    src = final.fetchPypi {
      pname = "waypaper";
      version = "2.9";
      hash = "sha256-5WJZG7Ia+2IWt4FQNXofgPPe6I1alX0/bF3YhfoO2pc=";
    };
  });
}
