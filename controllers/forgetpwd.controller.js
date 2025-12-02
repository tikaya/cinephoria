import { forgotPasswordService } from "../services/forgetpwd.service.js";

export const renderFormForgetPwd = (req, res) => {
  res.render("auth/forgetpwd");
};

export const submitForgetPwd = async (req, res) => {
  const { email } = req.body;

  try {
    await forgotPasswordService(email);
    res.render("auth/forgetpwd-success", {
  errorMessage: null
});

  } catch (err) {
    res.render("auth/forgetpwd", { errorMessage: err.message });
  }
};


