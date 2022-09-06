defmodule HairControl.Helper.Cpf do
  def cpf_validator({:ok, %{cpf: cpf}} = params) do
    cpf
    |> transform_in_integer()
    |> transform_in_list()
    |> apply_rule_validation()
    |> verify_validation(params)
  end

  def cpf_validator({:error, _result} = error), do: error

  defp transform_in_integer(cpf), do: String.to_integer(cpf)

  defp transform_in_list(cpf), do: Integer.digits(cpf)

  defp apply_rule_validation(cpf) do
    cpf
    |> Enum.reverse()
    |> Enum.split(2)
    |> first_digit_validation()
    |> secund_digit_validation()
  end

  defp first_digit_validation({[secund_digit, first_digit], list_validator}) do
    multiply_list_elements_by_increasing_index_starting_from_two(list_validator)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
    |> multiply_for_ten()
    |> rest_div_for_eleven()
    |> compare_digit(first_digit, list_validator, secund_digit)
    |> if_all_digits_are_equal()
  end

  defp secund_digit_validation({:ok, [secund_digit | list_validator]}) do
    multiply_list_elements_by_increasing_index_starting_from_two(list_validator)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
    |> multiply_for_ten()
    |> rest_div_for_eleven()
    |> compare_digit(secund_digit, list_validator)
  end

  defp secund_digit_validation({:error, _error_msg} = error), do: error

  defp multiply_list_elements_by_increasing_index_starting_from_two(
         list_validator,
         multiplier_list_valdator \\ [],
         factor \\ 2
       )

  defp multiply_list_elements_by_increasing_index_starting_from_two(
         [],
         multiplier_list_validator,
         _factor
       ),
       do: multiplier_list_validator

  defp multiply_list_elements_by_increasing_index_starting_from_two(
         [head | tail],
         multiplier_list_validator,
         factor
       ) do
    multiplier_list_validator = multiplier_list_validator ++ [head * factor]

    multiply_list_elements_by_increasing_index_starting_from_two(
      tail,
      multiplier_list_validator,
      factor + 1
    )
  end

  defp multiply_for_ten(digit_validator), do: digit_validator * 10
  defp rest_div_for_eleven(digit_validator), do: rem(digit_validator, 11)

  defp compare_digit(digit_validator, secund_digit, list_validator)
       when digit_validator == 10 do
    case secund_digit == 0 do
      false -> {:error, "falhou a segunda validdação"}
      true -> {:ok, [secund_digit | list_validator]}
    end
  end

  defp compare_digit(digit_validator, secund_digit, list_validator) do
    case digit_validator == secund_digit do
      false -> {:error, "falhou a segunda validdação"}
      true -> {:ok, [secund_digit | list_validator]}
    end
  end

  defp compare_digit(digit_validator, first_digit, list_validator, secund_digit)
       when digit_validator == 10 do
    case first_digit == 0 do
      false -> {:error, "falhou a primeira validdação"}
      true -> {:ok, [secund_digit | [first_digit | list_validator]]}
    end
  end

  defp compare_digit(digit_validator, first_digit, list_validator, secund_digit) do
    case digit_validator == first_digit do
      false -> {:error, "falhou a primeira validdação"}
      true -> {:ok, [secund_digit | [first_digit | list_validator]]}
    end
  end

  defp if_all_digits_are_equal({:ok, list_validator} = params) do
    case Enum.count(Enum.uniq(list_validator)) != 1 do
      false -> {:error, "cpf inválido, os digitos não podem ser todos iguais"}
      true -> params
    end
  end

  defp if_all_digits_are_equal({:error, _reason} = error), do: error

  defp verify_validation({:ok, _result_validation}, params), do: params
  defp verify_validation({:error, _msg_error} = error, _params), do: error
end
