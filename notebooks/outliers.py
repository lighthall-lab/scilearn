def group_exclude(df, group_col, value_col, upper_Q = 0.99865, lower_Q = 0.00135):
    """ Takes a DataFrame, column name to group on, and a value column name.
    
    Performs outlier exclusion based on quantile thresholds and returns a Series."""

    # Create Series of upper and lower bounds within-groups with respect to `group_col`
    value_upper = value_col + 'upper'
    value_lower = value_col + 'lower'
    upper_bounds = (df.groupby(group_col)
                        .quantile(upper_Q)[value_col]
                        .rename(value_upper)
                        .reset_index())
    lower_bounds = (df.groupby(group_col)
                        .quantile(lower_Q)[value_col]
                        .rename(value_lower)
                        .reset_index())
    
    # Merge `df` with upper and lower bounds, into `df_bounds`
    df_bounds = (df.merge(upper_bounds,'left')
                    .merge(lower_bounds,'left'))

    # Return a Series with values only where the value in `value_col`
    # is between the corresponding upper and lower bounds
    value_bound = value_col + '_bound'
    return(df_bounds[value_col].where(
                (df_bounds[value_col] > df_bounds[value_lower]) &
                (df_bounds[value_col] < df_bounds[value_upper]))
            .rename(value_bound))