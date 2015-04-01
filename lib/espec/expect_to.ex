defmodule ESpec.ExpectTo do
  @moduledoc """
    Defines `to` and `to_not` functions which call specific 'assertion'
  """

  @doc "Calls specific asserion."
  def to(rhs, {ESpec.ExpectTo, lhs}, positive \\ true) do
    case rhs do
      {:eq, value} -> ESpec.Assertions.Eq.assert(lhs, value, positive)
      {:eql, value} -> ESpec.Assertions.Eql.assert(lhs, value, positive)
      {:be, op, value} -> ESpec.Assertions.Be.assert(lhs, [op, value], positive) 
      {:be_between, min, max} -> ESpec.Assertions.BeBetween.assert(lhs, [min, max], positive)
      {:be_close, value, delta} -> ESpec.Assertions.BeCloseTo.assert(lhs, [value, delta], positive)
      {:match, value} -> ESpec.Assertions.Match.assert(lhs, value, positive)
      
      {:raise_exception, value} -> ESpec.Assertions.RaiseException.assert(lhs, value, positive)
      {:throw_term, value} -> ESpec.Assertions.ThrowTerm.assert(lhs, value, positive)
      {:change_to, func, value} -> ESpec.Assertions.ChangeTo.assert(lhs, [func, value], positive)
      {:change_from_to, func, [before, value]} -> ESpec.Assertions.ChangeFromTo.assert(lhs, [func, before, value], positive)
      
      {:have_all, func} -> ESpec.Assertions.Enum.HaveAll.assert(lhs, func, positive)
      {:have_any, func} -> ESpec.Assertions.Enum.HaveAny.assert(lhs, func, positive)
      {:have_at, pos, val} -> ESpec.Assertions.Enum.HaveAt.assert(lhs, [pos, val], positive)
      {:have_count, val} -> ESpec.Assertions.Enum.HaveCount.assert(lhs, val, positive)
      {:have_count_by, func, val} -> ESpec.Assertions.Enum.HaveCountBy.assert(lhs, [func, val], positive)
      {:have, val} -> ESpec.Assertions.Enum.Have.assert(lhs, val, positive)
      {:be_empty} -> ESpec.Assertions.Enum.BeEmpty.assert(lhs, [], positive)
      {:have_max, value} -> ESpec.Assertions.Enum.HaveMax.assert(lhs, value, positive)
      {:have_max_by, func, value} -> ESpec.Assertions.Enum.HaveMaxBy.assert(lhs, [func, value], positive)
      {:have_min, value} -> ESpec.Assertions.Enum.HaveMin.assert(lhs, value, positive)
      {:have_min_by, func, value} -> ESpec.Assertions.Enum.HaveMinBy.assert(lhs, [func, value], positive)
      
      {:have_first, value} -> ESpec.Assertions.List.HaveFirst.assert(lhs, value, positive)
      {:have_last, value} -> ESpec.Assertions.List.HaveLast.assert(lhs, value, positive)
      {:have_hd, value} -> ESpec.Assertions.List.HaveHd.assert(lhs, value, positive)
      {:have_tl, value} -> ESpec.Assertions.List.HaveTl.assert(lhs, value, positive)
      
      {:be_type, type} -> ESpec.Assertions.BeType.assert(lhs, type, positive)

      {:accepted, func, args} -> ESpec.Assertions.Accepted.assert(lhs, [func, args], positive)
    end
  end

  @doc "Just `to` with `positive = false`."
  def to_not(rhs, {ESpec.ExpectTo, lhs}), do: to(rhs, {ESpec.ExpectTo, lhs}, false)

  @doc "Alias fo `to_not`."
  def not_to(rhs, {ESpec.ExpectTo, lhs}), do: to(rhs, {ESpec.ExpectTo, lhs}, false)
end

