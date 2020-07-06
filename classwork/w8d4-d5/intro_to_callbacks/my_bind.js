Function.prototype.myBind(context) {
  const that = this;
  return function () {
    return that.apply(context)
  }
}